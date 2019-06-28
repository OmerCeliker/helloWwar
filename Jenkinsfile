pipeline {
  agent any
  stages {
    stage('PrintEnvVariables') {
      agent any
      steps {
        sh 'echo  $WORKSPACE'
      }
    }
    stage('Build') {
      agent {
        docker {
          image 'maven:3.6.1-jdk-8'
          args '-v  $WORKSPACE/.m2:/root/.m2 '
        }

      }
      steps {
        sh 'mvn  clean install '
      }
    }
    stage('Analysis') {
      parallel {
        stage('Security') {
          steps {
            sh 'echo running Security'
          }
        }
        stage('Code Quality') {
          steps {
            sh 'echo running Code Quality'
          }
        }
      }
    }
    stage('Tests') {
      parallel {
        stage('IntegrationTest') {
          steps {
            sh 'echo running Integration Test'
          }
        }
        stage('SmokeTest') {
          steps {
            sh 'echo smokeTest'
          }
        }
      }
    }
    stage('PushToRepo') {
      steps {
        sh '''
# use ~/.netrc
cd /var/lib/jenkins/workspace/helloWwar_master@2
rm -rf .m2
git pull origin
git add dist/hello-1.0.0.war
git config --global user.name "OmerCeliker"
git config --global user.email omer.s.celiker@gmail.com
git commit -m "released the war file"
git push origin master
 
'''
      }
    }
    stage('PublishService') {
      steps {
        sh '''
cd /var/lib/jenkins/workspace/helloWwar_master@2/terraformconfig
terraform init
terraform plan -out plan
terraform apply -auto-approve "plan" 

'''
      }
    }
  }
}
