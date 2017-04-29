#! /bin/sh

# define parameters
if [ "$#" -ne 1 ]; then
	echo $0 $1
	echo "please run with $0 appName"
	exit 1
fi

appName=$1

mkdir ../$appName
cp -r . ../$appName/
rm -rf ../$appName/.git ../$appName/node_modules ../$appName/release
sed -i "" "s/cucm-sqlquery-api/$appName/g" ../$appName/init.d/cucm-sqlquery-api ../$appName/monit.d/cucm-sqlquery-api ../$appName/copyMe.sh ../$appName/deploy.sh ../$appName/README.md ../$appName/src/*.ts ../$appName/tests/*.js ../$appName/src/services/*.ts ../$appName/src/routes/*.ts ../$appName/src/models/*.ts
mv ../$appName/init.d/cucm-sqlquery-api ../$appName/init.d/$appName
mv ../$appName/monit.d/cucm-sqlquery-api ../$appName/monit.d/$appName
