mysql-backup:
	./scripts/mysql/backup.sh
mysql-restore:
	./scripts/mysql/restore.sh
ssh-ansible-key:
	./scripts/ansible/ssh/keygen-ansible.sh
vault-key:
	./scripts/ansible/vault/gen-file.sh

run:
	sudo docker-compose -f docker/docker-compose.yml \
	--env-file files/env/default up
it:
	sudo docker exec -it semaphore sh
