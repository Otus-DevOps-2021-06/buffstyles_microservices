# buffstyles_microservices


## Домашнее задание №16 - docker-2.

### Основное задание:

 - Создан docker host, изучены основные команды docker cli.
 - Написан `Dockerfile` для создания образа нашего приложения.
 - Создан образ нашего приложения `buffstyles/otus-reddit:1.0`.
 - Образ залит на `Docker Hub`.

### Дополнительное задание 1:

 - Сформулированы отличия, на основе вывода команды `docker inspect` по отношению к контейнеру и образу. Объяснение  дописано в файл `docker-monolith/docker-1.log`.

 ### Дополнительное задание 2:

  - Создан каталог `docker-monolith/infra`
  - В каталоге `infra/terraform` собраны конфиги для поднятия инстансов. Количество задается переменной.
  - В каталоге `infra/ansible` создан плейбук для запуска роли `docker`, которая в свою очередь устанавливает на инстансы докер и запускает образ нашего приложения. Инвентори Yandex Cloud генерируется динамически.
  - В каталоге `infra/packer` создан шаблон, с помощью которого создается образ с уже установленным Docker. Провижинг образа происходит с помощью роли Ansible.


## Домашнее задание №17 - docker-3.

### Основное задание:

 - Созданы образы для сервисов нашего приложения - ui, comment, post.
 - Создана сеть для приложения.
 - Образ ui уменьшен в размере.
 - Создан volume reddit_db и подключен к контейнеру с MongoDB

### Дополнительное задание 1:

 - Контейнеры запущены с другими сетевыми алиасами. Адреса для взаимодействия переданы через переменные окружения при запуске.
 ```
docker run -d --network=reddit --network-alias=post_database --network-alias=comment_database mongo:latest

docker run -d --network=reddit --network-alias=postamp --env POST_DATABASE_HOST=post_database buffstyles/post:1.0

docker run -d --network=reddit --network-alias=commentaries --env COMMENT_DATABASE_HOST=comment_database buffstyles/comment:1.0

docker run -d --network=reddit --env POST_SERVICE_HOST=postamp --env COMMENT_SERVICE_HOST=commentaries -p 9292:9292 buffstyles/ui:1.0
 ```

### Дополнительное задание 2:

 - Собран образ на основе Alpine Linux для `ui`.
 - Образ `ui` уменьшен с 462 MB до 56 MB.
 - Образ `comment` уменьшен с 769 MB до 57.9 MB.
 - Образ `post` уменьшен со 111 МВ до 107 MB.
 - Скорость сборки пострадала, но значительно уменьше размер образа.
 - Уменьшенные варианты образов описаны в соотвутствующих `Dockerfile.1`
