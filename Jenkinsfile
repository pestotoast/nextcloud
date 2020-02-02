node {
    checkout scm
    def image = docker.build("pestotoast/nextcloud:latest")
	image.push()	
}