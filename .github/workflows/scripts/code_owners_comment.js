const fs = require('fs')
const path = require('path')

function findProjectName(pullRequestTitle) {
  const projectNameParts = pullRequestTitle.match(/\[(.*?)\]/)
  if (!projectNameParts || projectNameParts.length < 2) throw Error('No project name found in title')
  const projectName = projectNameParts[1]
  const projectFolder = path.join('projects', projectName)
  // if (!fs.existsSync(projectFolder)) return null
  return projectName
}

function findCodeOwners(projectName) {
  const filePath = path.join('CODEOWNERS')
  const data = fs.readFileSync(filePath, { encoding: 'utf-8' })

  const codeOwners = data.split('\n')
  const matchingOwners = []
  const projectFolder = `/projects/${projectName}`
  for (const line of codeOwners) {
    if (line === '' || line.indexOf('#') === 0) continue
    const [pattern, owners] = line.split(/\s+/)
    console.log(owners)
    if (pattern.indexOf(projectFolder) === 0) {
      matchingOwners.push(...owners.match(/\S+/g))
    }
  }
  return matchingOwners
}

module.exports = async ({ github, context, core }) => {
  const pullRequestTitle = context.payload.pull_request.title
  if (pullRequestTitle.indexOf('[') !== 0) return
  const projectName = findProjectName(pullRequestTitle)
  if (!projectName) throw Error("Project name not found! No folder under /projects/[your-project-name]")

  const codeOwners = findCodeOwners(projectName)
  console.log(codeOwners)
  if (codeOwners.length == 0) return

  const body = `${codeOwners.join(', ')} can you please review this pull-request? You have been assigned as code-owner to [${projectName}]`
  github.rest.issues.createComment({
    issue_number: context.issue.number,
    owner: context.repo.owner,
    repo: context.repo.repo,
    body: body
  })
}