library identifier: 'CrayonPayment-jenkins-sharedlib-sonarQube_multi@master', retriever: modernSCM([$class: 'GitSCMSource',
remote: 'https://github.com/CrayonPayment-KSA/CrayonPayment-jenkins-sharedlib-sonarQube_multi.git',
credentialsId: 'github_token'])

/* groovylint-disable DuplicateStringLiteral */
pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: ubuntu
            image: swr.ap-southeast-3.myhuaweicloud.com/CrayonPayment-jenkins-images/ubuntu:latest
            command:
            - cat
            tty: true
          - name: git
            image: swr.ap-southeast-3.myhuaweicloud.com/CrayonPayment-jenkins-images/git:latest
            command:
            - cat
            tty: true
          - name: flutter
            image: swr.ap-southeast-3.myhuaweicloud.com/CrayonPayment-jenkins-images/flutter_image:2.10.1
            command:
            - cat
            tty: true
            volumeMounts:
            - mountPath: /root/.gradle
              name: flutter
          - name: helm
            image: swr.ap-southeast-3.myhuaweicloud.com/CrayonPayment-jenkins-images/helm:latest
            command:
            - cat
            tty: true
          - name: build
            image: node:14.18-alpine
            command:
            - cat
            tty: true
          - name: docker
            image: swr.ap-southeast-3.myhuaweicloud.com/CrayonPayment-jenkins-images/docker:latest
            command:
            - cat
            tty: true
            volumeMounts:
            - mountPath: /var/run/docker.sock
              name: docker-sock
          volumes:
           - name: docker-sock
             hostPath:
                path: /var/run/docker.sock
           - name: flutter
             hostPath:
                path: /usr/local/bin
          imagePullSecrets:
          - name: default-secret
        '''
    }
  }

 environment{

	 appcenter_token = credentials('app_center')

  }
  
  stages {

    stage('Checkout Repository') {
	when{
        anyOf{
	        branch 'master'
          branch 'PR-*'
        }
      }
      steps {
        container('git') {
//           sh 'apk add git'
//           sh 'apk add openjdk11'
//           sh 'yarn cache clean'
//           sh 'yarn install --frozen-lockfile'
          checkout scm
        }
      }
    }
    stage('code linting') {
      when{
          branch 'PR-*'
      }
      steps {
        container('flutter') {
            withCredentials([gitUsernamePassword(credentialsId: 'github_token', gitToolName: 'git-tool')]) {
              	sh 'git fetch --all'
                sh 'git fetch origin master:refs/remotes/origin/master'
//              sh "yarn nx run-many --target=analyze --all" 
	  	sh 'yarn cache clean'
          	sh 'yarn install --frozen-lockfile'
          	sh "yarn nx affected --target=analyze --base=origin/master~1 --head=HEAD --parallel"
        }
        }
      }
    }

    stage('affected list') {
      when{
          branch 'PR-*'
      }
      steps {
        script {
          container('flutter') {
            withCredentials([gitUsernamePassword(credentialsId: 'github_token', gitToolName: 'git-tool')]) {
              sh 'echo "------------ GET AFFECTED ------------"'
              sh 'git fetch --all'
              sh 'git fetch origin master:refs/remotes/origin/master'
              sh 'yarn cache clean'
              sh 'yarn install --frozen-lockfile'
              sh 'rm -rf ./node_modules/.cache/nx'
              sh "yarn nx affected:libs --base=origin/master~1 --head=HEAD --exclude=welcome_business, network-manager, task-manager, shared-data-models, widgets, core, setting, merchant_document, merchant_qr, merchant_sign_in, my_storee, otp, kyc, email, home, CrayonPayment_exception_handle, payment, personal_details, signup, my_store,features-card-3-d-secure, p2p_payments, transactions, passcode, welcome, account-iban, customer-settings, merchant-settings, features-ocr, sign_in | grep -e '^  - ' | sed s/'^  - '//g  > test.txt"
              list = readFile('test.txt').readLines()
              echo "${list}"
              sh 'sleep 10'
            }
          }
        }
      }
    }

    stage('Unit Testing') {
      when{
        anyOf{
	        branch 'master'
          branch 'PR-*'
        }
      }
      steps {
        script{
          container('flutter') {
            withCredentials([gitUsernamePassword(credentialsId: 'github_token', gitToolName: 'git-tool')]) {
              sh 'echo "------------ Unit Testing All Project ------------"'
              sh 'yarn install --frozen-lockfile'
              sh 'rm -rf ./node_modules/.cache/nx'
              sh 'yarn nx affected --target=test --base=origin/master~1 --head=HEAD --parallel --skip-nx-cache'
              // Don't remove skip-nx-cache from above command, There is a limitaion with nx in generating coverage from cached apps.
              // so we removed nx cache in test stage alone.
            }
          }
        }
      }
    }
    stage('sonarqube') {
      when{
          branch 'PR-*'
      }
      environment {
        scannerHome = tool 'sonar-scanner'
      }
      steps {
        script {
          for (i in list) {
            stage("${i}--sonar scan") {
                container('flutter') { 
                  withSonarQubeEnv('sonar-server') {
                    sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectBaseDir=./libs/features/${i}"
                  }
                }
            }
            // stage("${i}--Quality Gate") {
            //     container('build') {
            //        withSonarQubeEnv('sonar-server') {
            //         qualityGates()                   
            //     }
            //   }
            // }
          }
        }
      }
    }

    stage('Build - customer') {
	when{
          branch 'master'
      }
      steps {
        container('flutter') {
                sh '''
                cd apps/customer
                flutter build apk --split-per-abi --build-name=1.0 --build-number=$BUILD_NUMBER --no-tree-shake-icons
        '''
        }
      }
    }
	stage('Build - merchant') {
	when{
          branch 'master'
      }
      steps {
        container('flutter') {
                sh '''
                cd apps/merchant
                flutter build apk --split-per-abi --build-name=1.0 --build-number=$BUILD_NUMBER --no-tree-shake-icons
        '''
        }
      }
    }
    stage('upload - customer') {
	when{
          branch 'master'
      }
      steps {
        container('curl') {
            script{
            appCenter apiToken: "${appcenter_token}" , appName: 'CrayonPayment-PAY-1', branchName: '', buildVersion: '', commitHash: '', distributionGroups: 'Collaborators', mandatoryUpdate: false, notifyTesters: true, ownerName: 'CrayonPayment-PAY', pathToApp: 'apps/customer/build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk', pathToDebugSymbols: '', pathToReleaseNotes: '', releaseNotes: ''
            
        }
        }
      }
    }
    stage('upload - merchant') {
	when{
          branch 'master'
      }
      steps {
        container('curl') {
            script{
            appCenter apiToken: "${appcenter_token}" , appName: 'CrayonPayment-PAY-Merchant-1', branchName: '', buildVersion: '', commitHash: '', distributionGroups: 'Collaborators', mandatoryUpdate: false, notifyTesters: true, ownerName: 'CrayonPayment-PAY', pathToApp: 'apps/merchant/build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk', pathToDebugSymbols: '', pathToReleaseNotes: '', releaseNotes: ''
        }
        }
      }
    }
  }
}
	  
