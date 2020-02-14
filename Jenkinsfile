node {
    checkout scm
    sh "rm -rf ./docker"
    sh "git clone https://github.com/nextcloud/docker/"
    docker.build("nextcloud:fpm-alpine", "docker/18.0/fpm-alpine")
    def image = docker.build("pestotoast/nextcloud:latest")
	image.push()	
}