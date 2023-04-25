const fs = require('fs')
const path = require('path')

module.exports = async () => {
  const indexHtmlFilePath = path.join('api', 'index.html')
  fs.writeFileSync(indexHtmlFilePath, 'Api under construction');
}