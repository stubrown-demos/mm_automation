pipeline {
    agent {
        kubernetes {
            label 'my-pod-template'
            defaultContainer 'jnlp'
            yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: maven
    image: maven
    command:
    - cat
    tty: true
"""
        }
    }
    parameters {
        string(name: 'MasterName', defaultValue: '', description: 'master to create')


    }
    stages {
        stage('Run maven') {
            steps {
                container('maven') {
                    withCredentials([usernamePassword(credentialsId: 'jcred', passwordVariable: 'jpassword', usernameVariable: 'juser')]) {
                        sh '''
                        ./scripts/create_master/create_master.sh ${MasterName} ${jpassword} ${juser}
                        '''
                    }
                }
            }
        }
    }
}