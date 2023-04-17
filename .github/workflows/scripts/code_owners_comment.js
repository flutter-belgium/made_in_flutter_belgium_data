const fs = require('fs')
const path = require('path')


function findProjectName(pullRequestTitle) {
  const projectNameParts = pullRequestTitle.match(/\[(.*?)\]/)
  if (!projectNameParts || projectNameParts.length < 2) throw Error('No project name found in title')
  const projectName = projectNameParts[1]
  console.log(projectName)
  const projectFolder = path.join('projects', projectName)

  console.log(projectFolder)
  if (!fs.existsSync(projectFolder)) return null
  return projectName
}

function findCodeOwners(projectName) {
  const filePath = path.join('CODEOWNERS')
  const data = fs.readFileSync(filePath, { encoding: 'utf-8' })
  console.log('Data:')
  console.log(data)

  const codeOwners = data.split('\n')
  console.log(codeOwners)
  for (const line of codeOwners) {
    if (line === '' || line.indexOf('#') === 0) continue
    console.log(`Line: ${line}`)
    const [pattern, owners] = line.split(/\s+/)
    console.log(pattern)
    console.log(owners)
    const regex = new RegExp('^' + pattern.replace(/[.*+?^${}()|[\]\\]/g, '\\$&').replace(/\/\*\*/g, '(?:\/[^\/]+)*\/?'));

    if (regex.test(projectName)) {
      return owners.split(/\s+/)
    }
  }

  return null
}

module.exports = async ({ github, context, core }) => {
  const pullRequestTitle = context.payload.pull_request.title
  if (pullRequestTitle.indexOf('[') !== 0) return
  const projectName = findProjectName(pullRequestTitle)
  // if (projectName == null) throw Error("Project name not found! No folder under /projects/[your-project-name]")

  const codeOwners = findCodeOwners(projectName)
  console.log(codeOwners)
  if (codeOwners == null) return

  const body = `${codeOwners.join(', ')} can you please review this pull-request? You have been assigned as code-owner to this project`
  github.rest.issues.createComment({
    issue_number: context.issue.number,
    owner: context.repo.owner,
    repo: context.repo.repo,
    body: body
  })
}