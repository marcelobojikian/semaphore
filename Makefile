backup:
	./scripts/mysql/backup.sh
	./scripts/full-backup.sh

restore:
	./scripts/full-restore.sh
	./scripts/mysql/restore.sh

ansible-ssh-keygen:
	./scripts/ansible/ssh/keygen.sh
ansible-vault-keygen:
	./scripts/ansible/vault/keygen.sh

docker-run:
	sudo docker-compose -f docker/docker-compose.yml \
	--env-file files/env/default up
docker-it:
	sudo docker exec -it semaphore sh
