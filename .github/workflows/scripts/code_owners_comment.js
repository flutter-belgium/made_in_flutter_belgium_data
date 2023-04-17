const fs = require('fs')
const path = require('path')


function findProjectPath(pullRequestTitle) {
  const projectNameParts = pullRequestTitle.match(/\[(.*?)\]/)
  if (projectNameParts.length < 2) throw Error('No project name found in title')
  const projectName = projectNameParts[1]
  const projectFolder = path.join(`projects/${projectName}`)

  if (!fs.existsSync(projectFolder)) return null
  return projectName
}

function findCodeOwners(projectPath) {
  const filePath = path.join('CODEOWNERS')
  const data = fs.readFileSync(filePath, { encoding: 'utf-8' })

  const codeOwners = data.split('\n')
  for (const line of codeOwners) {
    const [pattern, owners] = line.split(/\s+/)
    const regex = new RegExp(pattern);

    if (regex.test(projectPath)) {
      return owners.split(/\s+/)
    }
  }

  return null
}

module.exports = async ({ github, context, core }) => {
  const pullRequestTitle = context.payload.pull_request.title
  if (str.indexOf('[') === 0) return
  const projectName = findProjectPath(pullRequestTitle)
  if (projectName == null) throw Error("Project name not found! No folder under /projects/[your-project-name]")

  const codeOwners = findCodeOwners(projectName)
  if (codeOwners == null) return

  const body = `${codeOwners.join(', ')} can you please review this pull-request? You have been assigned as code-owner to this project`
  github.rest.issues.createComment({
    issue_number: context.issue.number,
    owner: context.repo.owner,
    repo: context.repo.repo,
    body: body
  })
}