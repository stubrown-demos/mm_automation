reqMasterName=$1
USER=admin
TOKEN=1195fffb0e4501bbde521300701c22c4e6
CJOC_URL=https://core.general.flow-training.beescloud.com/cjoc
sed "s/MASTERNAME/$reqMasterName/" createManagedMasterK8s.groovy.template > createManagedMasterK8s.groovy
curl -v -XPOST \
    -u $USER:$TOKEN \
    --data-urlencode "script=$(<./createManagedMasterK8s.groovy)" \
    "$CJOC_URL/scriptText"




curl -X POST "http://USERNAME:TOKEN@JENKINS_SERVER/createItem?name=SUBFOLDER" --data-binary "@prototype-config.xml" -H "Content-Type: text/xml"