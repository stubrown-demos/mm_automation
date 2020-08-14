reqMasterName=$1
USER=$2
TOKEN=$3
CJOC_URL=https://core.general.flow-training.beescloud.com/cjoc
sed "s/MASTERNAME/$reqMasterName/" createManagedMasterK8s.groovy.template > createManagedMasterK8s.groovy
curl -v -XPOST \
    -u $USER:$TOKEN \
    --data-urlencode "script=$(<scripts/create_master/createManagedMasterK8s.groovy)" \
    "$CJOC_URL/scriptText"
