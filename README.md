# demo_ansible
Файлы для демонстрационного вводного занятия по Ansible

# Подготовка

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
