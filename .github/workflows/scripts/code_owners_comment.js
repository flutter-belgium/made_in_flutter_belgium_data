module.exports = async ({ github, context, core }) => {
    const codeOwners = ["@vanlooverenkoen", "@vanlooverenkoen"]
    const body = `${codeOwners.join(', ')} can you please review this pull-request? You have been assigned as code-owner to this project`
    github.rest.issues.createComment({
      issue_number: context.issue.number,
      owner: context.repo.owner,
      repo: context.repo.repo,
      body: body
    })
}