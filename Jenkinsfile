properties([
    pipelineTriggers([cron('0 2 * * *')])
])


node {
    try {
        sh 'printenv'
        checkout scm
        sh "git clone https://github.com/nextcloud/docker/"
        docker.build("nextcloud:fpm-alpine", "docker/18.0/fpm-alpine")
        def image = docker.build("pestotoast/nextcloud:latest")
        image.push()	
    }
    finally {
        deleteDir()
        mail to: 'jenkins@pestotoast.de',
                subject: "Build ${currentBuild.currentResult} ${currentBuild.fullDisplayName}",
                body: "Build ${currentBuild.currentResult} at ${env.BUILD_URL} after ${currentBuild.durationString} \r\nBuild variables: ${currentBuild.buildVariables} \r\n Changeset: ${currentBuild.changeSets}"
    }  
}
