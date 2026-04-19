pipeline {
  agent any

  environment {
    APP_VERSION = '1.0.0'
    BUILD_TS    = sh(script: 'date "+%Y-%m-%d %H:%M:%S"', returnStdout: true).trim()
  }

  stages {
    stage('Checkout') {
      steps {
        echo "Cloning repository..."
        checkout scm
      }
    }

    stage('Build') {
      steps {
        echo "Building version ${APP_VERSION} at ${BUILD_TS}"
        sh 'chmod +x app.sh'
        sh './app.sh'
      }
    }

    stage('Test') {
      steps {
        echo "Running tests..."
        sh 'chmod +x test.sh'
        sh './test.sh'
      }
    }

    stage('Archive Artifacts') {
	when { branch 'main'}
      steps {
        echo "Archiving artifacts..."
        archiveArtifacts artifacts: 'app.sh', fingerprint: true
      }
    }
  }

  post {
    success {
      echo "Build #${BUILD_NUMBER} SUCCEEDED!"
    }
    failure {
      echo "Build #${BUILD_NUMBER} FAILED. Check logs: ${BUILD_URL}"
    }
    always {
      cleanWs()
    }
  }
}
