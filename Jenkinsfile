pipeline {
 agent any
 stages {
 stage("Compile") {
 steps {
 sh "./gradlew compileJava"
 }

 }

 stage("Unit test") {
 steps {
 sh "./gradlew test"
 }
 }

stage("Code coverage") {
     steps {
          sh "./gradlew jacocoTestReport"
          publishHTML (target: [
               reportDir: 'build/reports/jacoco/test/html',
               reportFiles: 'index.html',
               reportName: "JaCoCo Report"
          ])
          sh "./gradlew jacocoTestCoverageVerification"
     }
}

stage("Package") {
     steps {
          sh "./gradlew build"
     }
}
stage("Docker build") {
     steps {
      
          sh "docker build -t crakhim/spring-app ."
     }
}
stage("Docker push") {
     steps {
   sh "docker login -u chaimaarakhime@gmail.com -p ChaimaeServer"
sh "docker push crakhim/spring-app"
     }
}
stage("Deploy to staging") {
     steps {
 
          sh "docker run -d --rm -p 8765:8080 --name springappcontainer crakhim/spring-app"
     }
}
stage("Acceptance test") {
     steps {
          sleep 60
          sh "./acceptance_test.sh"
     }
}
     }
  post {
     always {
          sh "docker stop springappcontainer"
     }
}
}
 

