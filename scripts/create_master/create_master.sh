reqMasterName=$1
USER=admin
TOKEN=<>
CJOC_URL=https://core.general.flow-training.beescloud.com/cjoc
sed "s/MASTERNAME/$reqMasterName/" createManagedMasterK8s.groovy.template > createManagedMasterK8s.groovy
curl -v -XPOST \
    -u $USER:$TOKEN \
    --data-urlencode "script=$(<./createManagedMasterK8s.groovy)" \
    "$CJOC_URL/scriptText"
