#! /bin/sh

# define hosts to deploy to

case $1 in
	-prod)
		hosts=("app-host-1_prod.ciscospark.live")
		;;
	*)
		echo "please run with $0 -dev or $0 -test or $0 -prod"
		exit 1
esac

for i in ${hosts[@]}; do
	gulp
	gulpStatus=$?
	if [ $gulpStatus -eq 1 ]; then
		echo "Build failed please review the log"
		exit 1
	fi
	scp -r release/* root@${i}:/var/atc/cucm-sqlquery-api/
	scp endpoints.json root@${i}:/var/atc/cucm-sqlquery-api/
	scp gitInfo.json root@${i}:/var/atc/cucm-sqlquery-api/
	scp package.json root@${i}:/var/atc/cucm-sqlquery-api/
	ssh root@${i} "cd /var/atc/cucm-sqlquery-api; /root/.nvm/versions/node/v6.2.2/bin/npm prune; /root/.nvm/versions/node/v6.2.2/bin/npm install"
	scp monit.d/* root@${i}:/etc/monit.d/
	ssh root@${i} "service cucm-sqlquery-api stop"
	scp init.d/* root@${i}:/etc/init.d/
	ssh root@${i} "/sbin/chkconfig cucm-sqlquery-api on"
	ssh root@${i} "rm -f /var/atc/cucm-sqlquery-api/pid/app.pid"
	ssh root@${i} "service cucm-sqlquery-api start"
	ssh root@${i} "service monit reload"
done
