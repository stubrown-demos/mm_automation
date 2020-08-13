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
    stages {
        stage('Run maven') {
            steps {
                container('maven') {
                    sh '''#!/bin/bash
                    echo "hello world"
                    '''
                }
            }
        }
    }
}