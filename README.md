<h1 align="center">
    Semaphore v1.0
</h1>

<h4 align="center">  
    Project to simplify initial infrastructure configuration
</h4>

<p align="center">
  <a href="https://github.com/marcelobojikian" target="_blank" >
    <img alt="Github - Marcelo Nogueira" src="https://img.shields.io/badge/Github--%23F8952D?style=social&logo=github">
  </a>
  <a href="https://www.linkedin.com/in/marcelobojikian/" target="_blank" >
    <img alt="Linkedin - Marcelo Nogueira" src="https://img.shields.io/badge/Linkedin--%23F8952D?style=social&logo=linkedin">
  </a>
  <a href="https://github.com/marcelobojikian" target="_blank">
    <img alt="Feito por Marcelo Nogueira" src="https://img.shields.io/badge/Feito%20por-Marcelo_Nogueira-informational">
  </a>
</p>

<p align="center">
  <a href="#-project">Project</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-configuration">Configuration</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-how-to-use">How to use</a>
</p>

<br>

## 💻 Project

It should simplify the initial configuration of the infrastructure for new projects, using [SemaphoreUI](https://semaphoreui.com) and [MySQL](https://www.mysql.com). This ensures that the essential components are available from the beginning, facilitating development work without initial complications.

Additionally, environment files and sensitive files, such as SSH keys and Vault, will be pre-configured. This early pre-configuration simplifies the management of credentials and sensitive information.

The project should back up the entire project in a single file, along with the database and configuration files. The restoration process should also be simplified.

## 🔖 Configuration

Create a file with the configurations for each environment to be used in the **files/env** folder containing the information used in [SemaphoreUI](https://semaphoreui.com) and [MySQL](https://www.mysql.com).

By default, the **files/env/default** file can be as shown in the example below.

```bash
DB_DATABASE=semaphore
DB_USER=semaphore
DB_PASS=semaphore
DB_HOST=mysql
DB_PORT=3306
DB_DIALECT=mysql

MYSQL_RANDOM_ROOT_PASSWORD=yes

SEMAPHORE_ADMIN_PASSWORD=changeme
SEMAPHORE_ADMIN_NAME=admin
SEMAPHORE_ADMIN_EMAIL=admin@localhost
SEMAPHORE_ADMIN=admin
SEMAPHORE_ACCESS_KEY_ENCRYPTION=5DZ3slaGSalfHf1vlwq0G0HosPqMgViFhmyrXuwTlIU=
TZ=UTC
```

This file can be used during the initialization of docker-compose with the **--env-file** parameter.

More details about the environment variables will be written [here](files/env/README.md).

#### Sensitive files and credentials

All sensitive files used in Semaphore will be copied from the **files/security** folder to the **/var/security** folder inside the container. Remember that the user used in the Docker image is __semaphore__ and the files must have the necessary permissions for their use.

The version of SemaphoreUI used in this project allows the use of Ansible, Terraform, Tofu, and Bash. For greater standardization, separate each file into their respective subfolders within the **files/security** directory.

All mandatory files and details regarding this folder will be further elaborated [here](files/security/README.md).

#### Backup and Restore

All backup files should be compressed in the **files/backups** folder. These will be used to restore all sensitive files and the database if necessary. The expected filename is **backup.gz**. 

See more details [here](files/backups/README.md).

## 🤔 How to use

To start Docker with SemaphoreUI and SQL, you must configure a configuration file as mentioned earlier and use it with the **--env-file** parameter. If you are using the mentioned example, you can start the project with the command below.

```bash
docker-compose -f docker/docker-compose.yml \
	--env-file files/env/default up
```

To generate SSH or Vault keys, use the corresponding scripts below:

```bash
make ansible-ssh-keygen
make ansible-vault-keygen
```

To perform backups or restore the latest backup, use the scripts below:

```bash
make backup
make restore
```
