USER=admin
TOKEN=1195fffb0e4501bbde521300701c22c4e6
JENKINS_SERVER=core.general.flow-training.beescloud.com/ref-master

curl https://$USER:$TOKEN@$JENKINS_SERVER/job/TestFolder/config.xml > prototype-config.xml