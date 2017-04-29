Generic API (BoilerPlate)
=========
This is a base type script project to use as a template for other typescript projects

### Installation
1. If you don't already have it install node: I suggest [NVM](https://github.com/creationix/nvm)
1. If you don't already have it install gulp: npm install -g gulp
1. Then run: npm install
1. Optionally install Atom with the atom-typescript package...you can also use any other ide you want

### Run Locally
To run locally first copy the properties.json.sample to properties.json and modify the user and password fields then run: __npm run start__ OR gulp watch.  This command will compile the code and start the service with node. It will also set a watcher on the current code and if anything changes it will recompile the code and then restart the node service.

### Deploy
Run ./deploy -{{env}}

### Cron Schedule
Here is the crontab setup on the root user in dev, test, and prod:
30 4 * * * cd /var/atc/cucm-sqlquery-api/; /root/.nvm/versions/node/v6.2.2/bin/node ./runCache.js

### API Docs
Here are the endpionts that are available from this service:

[//]: # "Begin API Endpoints"
[//]: # "End API Endpoints"
