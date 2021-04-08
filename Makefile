build-pat:
	cd packer/ && packer build gitlab_pat.json
	cd terraform/ && terraform init && terraform apply -auto-approve
