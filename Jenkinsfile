properties([
    pipelineTriggers([cron('0 2 * * 1')])
])


node {
    try {
        sh 'printenv'
        checkout scm
        sh "git clone https://github.com/nextcloud/docker/"
        docker.build("nextcloud:fpm-alpine", "--no-cache --pull docker/21.0/fpm-alpine/")
        def image = docker.build("pestotoast/nextcloud:amd64", "--no-cache .")
        image.push()	
    }
	catch (ex) {
        mail to: 'jenkins@pestotoast.de',
                subject: "Build ${manager.build.result} ${currentBuild.fullDisplayName}",
                body: "Build ${manager.build.result} at ${env.BUILD_URL} after ${currentBuild.durationString}
	    error "Build failed"
	}
    finally {
        deleteDir()
    }  
}
