const core = require('@actions/core')
const { exec } = require('@actions/exec')

async function  run (){
  await exec(`npm install`)
  await exec(`docker run --name redis --publish 6379:6379 --detach redis:${core.getInput('redis-version')}`)
}

run()
