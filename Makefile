docker-build:
	git pull
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 293222827824.dkr.ecr.us-east-1.amazonaws.com
	docker build -t 293222827824.dkr.ecr.us-east-1.amazonaws.com/portfolio-service:${image_tag} .
	docker push 293222827824.dkr.ecr.us-east-1.amazonaws.com/portfolio-service:${image_tag}

eks-deploy:
	env
	aws eks update-kubeconfig --name dev
	helm upgrade -i portfolio-service helm -f helm/values/portfolio-service.yml --set image.tag=${image_tag}