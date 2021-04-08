# Gitlab PAT - Instalacao automatica de um runner privado do Gitlab utilizando a stack PACKER/ANSIBLE/TERRAFORM

## Como funciona

O Packer irá criar uma AMI na conta utilizando como provisioner o 2 playbooks do ansible: Um que instala o docker e o docker+machine, e outro que instala o gitlab-runner. No final, o Terraform sobe a instância com a AMI criada.

## Como executar

* 1º - tenha o Packer, o Terraform e o Ansible instalados

* 2º - Altere as configurações tanto do Terraform quanto do Packer, especificando todas as coisas que forem necessárias (ex: VPC, Subnet, Security Group, etc)

* 3º - digite `make` na raiz do repositório

* 4º - Após a execução tanto do packer, quanto do terraform, será necessário registrar manualmente o runner do gitlab. Use o `arquivo_exemplo.toml` para facilitar as configurações do runner.

## Ferramentas

### Packer

O Packer é uma ferramenta criada pela hashicorp para auxiliar na criação de AMIs. Sua sintaxe funciona como um Json ou um arquivo HCL. No arquivo, são definidas algumas configurações da AMI na aba de **builders** (como nome, ami base, etc) e o que será executado antes da AMI ser criada como **provisioners**. Nesse caso, nosso **provisioner** é o Ansible.

## Ansible

O ansible é uma ferramenta criada pela Red Hat para automatizar a instação de pacotes/arquivos. Ele é utilizado para instalar tudo que a AMI precisa (Todas as dependencias e os pacotes do Docker, Docker Machine e Gitlab-Runner).

## Terraform

O Terraform é outra ferramenta criada pelo Hashicorp, e é a principal ferramenta de IaaC. Ela nos ajuda a automatizar a implementação de infraestutura em cloud.

| [<img src="https://github.com/lucascdourado.png?size=115" width=115><br><sub>@lucascdourado</sub>](https://github.com/lucascdourado) | [<img src="https://github.com/Tawliew.png?size=115" width=115><br><sub>@Tawliew</sub>](https://github.com/Tawliew) |

| :---: | :---: |


