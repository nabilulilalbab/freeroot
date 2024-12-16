const express = require('express');
const fs = require('fs').promises;
const { CodeSandbox, VMTier } = require("@codesandbox/sdk");
const { telemetry, eventTypes } = require('./tlm');
const { generateRandomId } = require('./utils')

const app = express();
app.use(express.json()); // Add middleware to parse JSON bodies
const port = 3001;

const template_options = {
  us: '5nxppx',
  eu: '5nxppx'
}

const IDS = [
  template_options.us,
  template_options.us,
  template_options.us,
  template_options.eu];

const template_id = template_options.us

const sdk = new CodeSandbox(
  "csb_v1_vX6JoKqKb68UIZPKWH2amcz323i1jndJJCV4It7u39M"
);
const createLink = async () => {

  const sandbox = await sdk.sandbox.create();
  console.log("Writing dockerfile", sandbox.id);

  // Read the Dockerfile content and write it to the sandbox
  const dockerfileContent = await fs.readFile('Dockerfile', 'utf8');
  await sandbox.fs.writeTextFile(
    "Dockerfile",
    dockerfileContent
  );

  // Write the devcontainer configuration to use our custom Dockerfile
  await sandbox.fs.writeTextFile(
    ".devcontainer/devcontainer.json",
    JSON.stringify({
      build: {
        dockerfile: "../Dockerfile"
      }
    })
  );

  console.log("Rebooting sandbox");
  // Reboot sandbox so it will use new docker image
  await sandbox.reboot();

  console.log("Running VSCode server");
  // Run the Open VSCode server command with proper parameters as per documentation
  const shell = sandbox.shells.run(
    "/home/.openvscode-server/bin/openvscode-server --host 0.0.0.0 --port 1025 --without-connection-token"
  );

  let getToken = '';
  shell.onOutput((output) => {
    console.log(output);
    if (output.includes("/?tkn")) {
      getToken = output.split("/?tkn=")[1].trim();
      console.log("Token:", getToken);
      console.log("Preview URL:");
    }
  });

  const portInfo = await sandbox.ports.waitForPort(1025);
  const getUrl = portInfo.getPreviewUrl();

  console.log("Sandbox URL:", `${getUrl}/?tkn=${getToken}`);
  await sandbox.hibernate(); //hibernate step
  
  return `${getUrl}/?tkn=${getToken}`;
}

// Example spec selection 
// const sandbox = await sdk.sandbox.create({
//   template: templateId,
//   vmTier: VMTier.Pico
// });

async function createFromTemplate(templateId = template_id, codeOptions = null){
  const timestamp_start = Date.now()
  let req_id = generateRandomId()
  try {
    console.log(`---> 🛜 generate from template req_id: ${req_id} - templateId: ${templateId}`)
    //using a template
    const sandbox = await sdk.sandbox.create({
      template: templateId,
      vmTier: VMTier.Nano,
      hibernationTimeoutSeconds: 300
    });
    console.log(`---> step 2 generate from template req_id: ${req_id} - templateId: ${templateId}`)
    
    // Create workspace directory
    await sandbox.shells.run("mkdir -p /home/workspace/workspace-blank");
    console.log(`---> step 3 generate from template req_id: ${req_id} - templateId: ${templateId}`)
    
    // If code options are provided, create the code file
    if (codeOptions && codeOptions.code && codeOptions.language) {
      const extension = getFileExtension(codeOptions.language);
      const filename = `main.${extension}`;
      const filepath = `/home/workspace/workspace-blank/${filename}`;
      
      // Write the code file
      await sandbox.fs.writeTextFile(filepath, codeOptions.code);
      console.log(`Created code file: ${filepath}`);
    }
    console.log(`---> step 4 ${sandbox.editorUrl}`)
    
    const portInfo = await sandbox.ports.waitForPort(1025);
    console.log(portInfo.getPreviewUrl());
    console.log(sandbox.editorUrl);
    const editorUrl = sandbox.editorUrl;
    sandbox.disconnect();
    console.log(`---> step 5 generate from template req_id: ${req_id} - templateId: ${templateId}`)

    if (portInfo.getPreviewUrl().includes('-')) {
      let url = portInfo.getPreviewUrl().split('-')[0] + '.csb.app'
      
      console.log(`---> ✅success generate from template req_id: ${req_id} - time: ${Date.now() - timestamp_start}`)
      return url;
    }
    console.error(`---> 🚫 error generate from template req_id url gen: ${req_id}`)
    return null
  } catch (error) {
    console.error(`---> 🚫 error generate from template req_id: ${req_id}`, error)
    return null
  }
}

function getFileExtension(language) {
  try {
    if (!language){
      return '.txt'
    }
    const extensions = {
      'javascript': 'js',
      'python': 'py',
      'java': 'java',
      'cpp': 'cpp',
      'c': 'c',
      'typescript': 'ts',
      'ruby': 'rb',
      'php': 'php',
      'go': 'go',
      'rust': 'rs',
      'html': 'html',
      'css': 'css'
    };
    if (!extensions[language]){
      return language
    }
    if (language?.toLowerCase() && extensions[language?.toLowerCase()]){
      return extensions[language?.toLowerCase()]
    }
    return 'txt'
  } catch (error) {
    console.error('getFileExtension error', error)
    return 'txt'
  }
}

let back_log_links = []
const MAX_BACK_LOG_LINKS = 1
const INITIATE_ON_SERVER_START = true
async function addLinkToBackLog() {
  // return // disabled function 
  
  let templateId = IDS[Math.floor(Math.random() * IDS.length)] // random pick eu vs us
  
  let url = await createFromTemplate(templateId)
  if (url){
    back_log_links.push(url)
  }
}

//on server start check if back_log_links has 5 links
(async ()=>{
  if ( back_log_links?.length === 0 && INITIATE_ON_SERVER_START){
    for (let i = 0; i < MAX_BACK_LOG_LINKS; i++) {
      await addLinkToBackLog()
    }
  }
})()

app.post('/createLink', async (req, res) => {
  const request_timestamp = Date.now()
  telemetry(eventTypes.other, '', {tag: 'check-vscode-url', status: 'request-done'})
  try {
    //check if there is a ready link inside back_log_links
    if (back_log_links?.length > 0){
      const url = back_log_links.shift()
      
      // If code is provided, write the code to the existing sandbox
      if (req.body?.code && req.body?.language) {
        const codeOptions = {
          code: req.body?.code,
          language: req.body?.language
        };

        if (url?.split('https://')[1] && url?.split('https://')[1]?.split('.csb')[0]) {
          let id = url.split('https://')[1].split('.csb')[0]
          const sandbox = await sdk.sandbox.open(id);
          const extension = getFileExtension(codeOptions.language);
          const filename = `main.${extension}`;
          const filepath = `/project/sandbox/user-workspace/${filename}`;
  
          // Write the code file to the existing sandbox
          await sandbox.fs.writeTextFile(filepath, codeOptions.code);
          console.log(`Updated code file: ${filepath}`);
        }
      }
      
      res.json({url})
      telemetry(eventTypes.other, '', {tag: 'check-vscode-url', status: 'request-success'})
      
      addLinkToBackLog() // add one instead

    } else {
      // let url = await createLink(); // new docker
      // If no backlog links are available, create a new one
      const codeOptions = req.body?.code && req.body?.language ? {
        code: req.body?.code,
        language: req.body?.language
      } : null;
      
      let url = await createFromTemplate(template_id, codeOptions)
      let good_url = false
      if (url) {
        good_url = await checkIfSuccess(url)
      }
      if (good_url) {
        res.json({url})
        
        addLinkToBackLog()
        telemetry(eventTypes.other, '', {tag: 'check-vscode-url', status: 'request-success', time: Date.now() - request_timestamp})
      }else{
        url = await createFromTemplate()
        if (url) {
          let good_url = await checkIfSuccess(url)
          if (good_url) {
            res.json({ url })

            addLinkToBackLog()
            telemetry(eventTypes.other, '', {tag: 'check-vscode-url', status: 'request-success', time: Date.now() - request_timestamp})
          } else {
            res.status(500).json({ error: 'Failed to create link' });
          }
        }
      }
    }
  } catch (error) {
    console.error('Error creating link:', error);
    res.status(500).json({ error: 'Failed to create link' });
  }
});

async function checkIfSuccess(url) {
  try {
    await new Promise(resolve => setTimeout(resolve, 2000));
    var requestOptions = {
      method: 'GET',
      redirect: 'follow'
    };
  
    let response = await fetch(url, requestOptions)
    let result = await response.text()
    if (result.includes('Bad Gateway')) {
      telemetry(eventTypes.other, '', {tag: 'check-vscode-url', status: 'request-fail', message: 'Bad Gateway'})
      return false
    } else {
      return true
    }
  } catch (error) {
    return false
  }
}

app.listen(port, () => {
  console.log(`Dummy API running at http://localhost:${port}`);
});
