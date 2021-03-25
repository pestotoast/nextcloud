properties([
    pipelineTriggers([cron('0 2 * * 1')])
])


node {
    try {
        sh 'printenv'
        checkout scm
        sh "git clone https://github.com/nextcloud/docker/"
        sh "sed -i s/php:7.4-fpm-alpine3.13/php:8-fpm-alpine/g docker/21.0/fpm-alpine/Dockerfile"
        sh "sed -i 's/pecl install imagick-3.4.4;/mkdir -p \/usr\/src\/php\/ext\/imagick; curl -fsSL https:\/\/github.com\/Imagick\/imagick\/archive\/refs\/heads\/master.tar.gz \| tar xvz -C \"\/usr\/src\/php\/ext\/imagick\" --strip 1; docker-php-ext-install imagick;/g' docker/21.0/fpm-alpine/Dockerfile"
        docker.build("nextcloud:fpm-alpine", "--no-cache --pull docker/21.0/fpm-alpine/")
        def image = docker.build("pestotoast/nextcloud:amd64", "--no-cache .")
        image.push()	
    }
	catch (ex) {
        mail to: 'jenkins@pestotoast.de',
                subject: "Build error ${currentBuild.fullDisplayName}",
                body: "Build error at ${env.BUILD_URL} after ${currentBuild.durationString}"
	    error "Build failed"
	}
    finally {
        deleteDir()
    }  
}

