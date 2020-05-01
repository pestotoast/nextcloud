properties([
    pipelineTriggers([cron('0 2 * * 1,3,5')])
])


node {
    try {
        sh 'printenv'
        checkout scm
        sh "git clone https://github.com/nextcloud/docker/"
        docker.build("nextcloud:fpm-alpine", "--no-cache --pull docker/18.0/fpm-alpine/")
        def image = docker.build("pestotoast/nextcloud:amd64", "--no-cache .")
        image.push()	
    }
	catch (ex) {
		mail to: 'jenkins@pestotoast.de',
			subject: "Build ${currentBuild.result} ${currentBuild.fullDisplayName}",
            body: "Build ${currentBuild.result} at ${env.BUILD_URL} after ${currentBuild.durationString} \r\nBuild variables: ${currentBuild.buildVariables} \r\n Changeset: ${currentBuild.changeSets}"
		error "Build failed."
	}
    finally {
        deleteDir()
    }  
}
