pipeline {
    agent any

    tools {
        
        maven "maven-3.8.6" 
    }
environment {
    DOCKERHUB_CREDENTIALS=credentials('DockerHub')
}
  // stage1
    stages {    
        stage('Verify Branch') {
            steps {
                echo "$GIT_BRANCH"
            }
           
        }

// stage2
    stage('Build Maven') {
            steps {

               sh(script: """
                   
               mvn clean install
            """) 
            }
            post {

                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
                  failure {
                 echo "failllllllllllll"
                  }
            }
         }
  
 // stage3
          stage('Build Docker') {
            steps {
                
               sh(script: """
                   
               docker build -t algn48/docker-image .

            """) 

            }
            post {
             success {
                echo " docker successfully :)"
                   }
             failure {
                echo "docker failed   :("
                     }
                }
          }
// stage4
    

    stage('Login') {
            steps {
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
           
        }
        stage('Push image') {
            steps {

            
               sh(script: """
                
            docker push algn48/docker-image

                

                    """)    
            }
        

           post {
             success {
                echo " Push successfully :)"
                   }
             failure {
                echo "Push failed   :("
                     }
                }
             }


stage('Logout') {
            steps {
                sh 'docker logout'
            }
           
        }
    }
}