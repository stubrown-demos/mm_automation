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
                    sh '''
                    create_master.sh $MasterName
                    '''
                }
            }
        }
    }
}