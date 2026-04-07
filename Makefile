docker-build:
	git pull
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 293222827824.dkr.ecr.us-east-1.amazonaws.com
	docker -t 293222827824.dkr.ecr.us-east-1.amazonaws.com/portfolio-service:latest .
	docker push 293222827824.dkr.ecr.us-east-1.amazonaws.com/portfolio-service:latest
