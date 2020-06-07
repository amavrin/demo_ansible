# Демонстрационное вводное занятия по Ansible

## Требования

1. Операционная система Linux или MacOS X
2. Установленный [VirtualBox] https://www.virtualbox.org/wiki/Downloads
3. Установленный [Vagrant] https://www.vagrantup.com/downloads.html

*Примечание*: возможно использование Windows в качестве рабочей машины.
В этом случае необходимо после запуска виртуальных хостов
на хосте `manager`
1. Настроить разрешение имён - добавить адрес хоста `host1` в `/etc/hosts`
2. Сгенерировать ключ `ssh` через `ssh-keygen` и скопировать его публичную часть
   на хост `host1` через `ssh-copy-id`.

# Подготовка
Далее приведены инструкции для Linux или MacOS X.

## Клонирование репозитория с файлами для занятия
```
git clone https://github.com/amavrin/demo_ansible
```

## Установка плагина для разрешения имени виртуальных машин
```
vagrant plugin install vagrant-hosts
```

## Запуск виртуальных машин
```
vagrant up
```

## Вход на управляющую машину по SSH
```
ssh-add $(vagrant ssh-config manager | grep IdentityFile | awk '{print $2}')
vagrant ssh manager -- -A
```

# Работа с Ansible

Файлы Ansible находятся в каталоге `ansible`, который доступен
на машине `manager` по пути `/vagrant/ansible`. Этот каталог должен
быть текущим каталогом.
```
cd /vagrant/ansible
```

## Проверка доступности хоста `host1`
```
ansible -m ping all
```
Если всё настроено верно, будет получен результат
```
```
