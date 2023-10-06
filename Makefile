execute:
	terraform init
	terraform plan
	terraform apply

graph:
	terraform graph | dot -Tsvg > graph.svg
	