module.exports = async ({ github, context, core }) => {
  console.log(context.actor)
  console.log('----')
  console.log(context)
}