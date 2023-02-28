#!/bin/bash

echo "Criação dos diretórios"
mkdir /public
mkdir /admin
mkdir /ven
mkdir /sec

echo "Criação dos grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criação dos usuários e associação aos grupos"
useradd -G GRP_ADM carlos
useradd -G GRP_ADM maria
useradd -G GRP_ADM joao

useradd -G GRP_VEN debora
useradd -G GRP_VEN sebastiana
useradd -G GRP_VEN roberto

useradd -G GRP_SEC josefina
useradd -G GRP_SEC amanda
useradd -G GRP_SEC rogerio

echo "Definição das permissões de acesso aos diretórios"
chown root:GRP_ADM /admin
chmod 770 /admin

chown root:GRP_VEN /ven
chmod 770 /ven

chown root:GRP_SEC /sec
chmod 770 /sec

chown root:root /public
chmod 777 /public

echo "Definição das permissões de acesso aos usuários"
setfacl -R -m u:carlos:rwx /public
setfacl -R -m u:maria:rwx /public
setfacl -R -m u:joao:rwx /public

setfacl -R -m u:debora:rwx /ven
setfacl -R -m u:sebastiana:rwx /ven
setfacl -R -m u:roberto:rwx /ven

setfacl -R -m u:josefina:rwx /sec
setfacl -R -m u:amanda:rwx /sec
setfacl -R -m u:rogerio:rwx /sec

echo "Restrição de acesso aos diretórios"
setfacl -R -m u:carlos:--- /ven
setfacl -R -m u:carlos:--- /sec

setfacl -R -m u:maria:--- /ven
setfacl -R -m u:maria:--- /sec

setfacl -R -m u:joao:--- /ven
setfacl -R -m u:joao:--- /sec

setfacl -R -m u:debora:--- /admin
setfacl -R -m u:debora:--- /sec

setfacl -R -m u:sebastiana:--- /admin
setfacl -R -m u:sebastiana:--- /sec

setfacl -R -m u:roberto:--- /admin
setfacl -R -m u:roberto:--- /sec

setfacl -R -m u:josefina:--- /admin
setfacl -R -m u:josefina:--- /ven

setfacl -R -m u:amanda:--- /admin
setfacl -R -m u:amanda:--- /ven

setfacl -R -m u:rogerio:--- /admin
setfacl -R -m u:rogerio:--- /ven
