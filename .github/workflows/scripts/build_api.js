const fs = require('fs')
const path = require('path')

module.exports = async () => {
  const apiDir = 'api'
  const indexHtmlFilePath = path.join(apiDir, 'index.html')
  if (!fs.existsSync(apiDir)) {
    fs.mkdirSync(apiDir, { recursive: true })
  }
  fs.writeFileSync(indexHtmlFilePath, 'Api under construction');
}