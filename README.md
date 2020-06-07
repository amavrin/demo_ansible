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
cd demo_ansible
```

## Установка плагина для разрешения имени виртуальных машин
```
vagrant plugin install vagrant-hosts
```

## Запуск виртуальных машин
```
vagrant up
```

## Добавление ключей ssh к `ssh-agent`
```
ssh-add $(vagrant ssh-config | grep IdentityFile | awk '{print $2}')
```

## Вход на управляющую машину по SSH
```
vagrant ssh manager -- -A

```

## Проверка настроек сети
1. Хост `host1` должен быть доступен по сети
```
ping host1
```

2. Пользователь `vagrant` должен иметь возможность зайти на `host1` по SSH
```
ssh host1
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
host1 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

## Выполнение плейбука Ansible
1. Выполнение плейбука в режиме проверки
```
ansible-playbook --check nginx_install.yml
```

2. Если выполнение плейбука в режиме проверки не выдало ошибки,
выполнить плейбук в обычном режиме.
```
ansible-playbook nginx_install.yml
```

## Проверка результата работы плейбука
1. С управляющего хоста
```
curl http://host1
```

2. С рабочей машины пользователя

Открыть URL `http://localhost:8881`
