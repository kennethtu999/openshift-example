# 環境安裝

## 安裝
```
git clone git@github.com:kennethtu999/openshift-example.git
cd openshift-example
vagrant plugin install vagrant-vbguest
wget  https://github.com/openshift/origin/releases/download/v1.4.1/openshift-origin-server-v1.4.1-3f9807a-linux-64bit.tar.gz
```

### 建立基礎測試環境
如果有遇到任何virtualbox guest plugin的安裝問題，試著更新相關的東西吧！
```
cd basebox
Vagrant up
Vagrant package
Vagrant box add cents-7-docker-ansible package.box
Vagrant box list
Vagrant destroy -f
rm -rf package.box
cd ..
```

### 安裝AllInOne環境
```
cd allinone
Vagrant up
```

## 測試
```
curl https://raw.githubusercontent.com/sameersbn/docker-redmine/master/docker-compose.yml > docker-compose.yml
oc import docker-compose -f docker-compose.yml
```
```
docker pull centos/postgresql-95-centos7
oc new-app \
    -e POSTGRESQL_USER=redmine \
    -e POSTGRESQL_PASSWORD=redmine \
    -e POSTGRESQL_DATABASE=db_redmine \
    centos/postgresql-95-centos7 db_redmine
```


# TBD

## 3 安裝Ansible並載入預設設定
```
ssh-keygen -t rsa -C "mailId@mail.com"
ssh-copy-id root@127.0.0.1
yum install -y git epel-release
yum install -y ansible
git clone https://github.com/kennethtu999/openshift-example
```

### 安裝Jenkins / Redmine / Gitlab

```
cd openshift-example
bash 0_linux.sh
```
