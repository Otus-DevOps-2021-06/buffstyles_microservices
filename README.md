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


## Домашнее задание №18 - docker-4.

### Основное задание:

 - Ознакомление с видами сетевых драверов в Docker.
 - Создана сеть `reddit`. Запущен проект с испольнованием данной сети.
 - Созданые сети `front_net` и `back_net`. Проект запущен с испольнованием данных сетей. Сервис `ui` не имеет доступа к MongoDB напрямую.
 - Создан `docker-compose.yml` для поднятия проекта.
 - `docker-compose.yml` переделан под кейс со множеством сетей и сетевых алиасов.
 - Файл параметризован с помощью переменных окружения.
 - Параметры записаны в файл `.env`. В репозиторий доступен пример `.env.example`
 - Имя проекта также задается в файле `.env` как переменная окружения. Также можно задать имя при запуске `docker-compose up -d --project-name "NAME"`.

### Дополнительное задание 1:

 - Создан файл `docker-compose.override.yml`.
 - Позволяет изменять код каждогоприложения, не выполняя повторную сборку образа.
 - Позволяет запускать puma для руби приложений в дебаг режиме с двумя воркерами.


## Домашнее задание №19 - gitlab-ci-1.

### Основное задание:

 - Поднята виртуальная машина с помощью Terraform.
 - Установлен Docker с помощью Ansible роли.
 - Поднят контейнер Gitlab с помощью Docker-compose.
 - Создан тестовый проект.
 - Создан пайплайн файл `.gitlab-ci.yml`
 - Поднят контейнер GitLab Runner. Произведена регистрация раннера.

### Дополнительное задание 1:

 - Создана Ansible роль `gitlab` для поднятия GitLab в контейнере.

### Дополнительное задание 2:

 - На этапе `build` происходит запуск контейнеров с mongodb и reddit. Создается динамическое окружение для каждой новой ветки.

### Дополнительное задание 3:

 - Создана Ansible роль `gitlab-runner` для поднятия GitLab Runner в контейнере.

### Дополнительное задание 4:

 - Ссылка на Slack чат с оповещениями GitLab - https://devops-team-otus.slack.com/archives/C0258C9RS1Z


## Домашнее задание №20 - monitoring-1.

### Основное задание:

 - Создан Docker образ `buffstyles/prometheus` с конфигурацией для мониторинга наших микросервисов.
 - Собраны образы приложений скриптом `docker_build.sh` для каждого сервиса.
 - Обновлен `docker-compose.yml`, добавлен сервис мониторинга.
 - Поиграно с healthcheck и графиками.
 - Обновлен `docker-compose.yml`, добавлен node exporter для экспорта метрик докер хоста.
 - Добавлен таргет в конфигурацию мониторинга, пересобран образ `buffstyles/prometheus`.
 - Созданные образы запушены на DockerHub - https://hub.docker.com/u/buffstyles.

### Дополнительное задание 1:

 - В Prometheus добавлен мониторинг MongoDB с использованием `buffstyles/mongodb-exporter`. Файлы сборки - `monitoring/mongodb-exporter`
 - Пересобран образ `buffstyles/prometheus`.
 - Обновлен `docker-compose.yml`.

### Дополнительное задание 2:

 - В Prometheus добавлен probe-мониторинг сервисов comment, post, ui с использованием `buffstyles/blackbox-exporter`. Файлы сборки - `monitoring/blackbox-exporter`
 - Пересобран образ `buffstyles/prometheus`.
 - Обновлен `docker-compose.yml`.

### Дополнительное задание 3:

 - Создан `Makefile` для сборки и пуша на DockerHub образов `post`, `comment`, `ui`, `mongodb-exporter`, `blackbox-exporter`, `prometheus`.


## Домашнее задание №21 - monitoring-2.

### Основное задание:

 - Основной файл `docker-compose.yml` разбит на два, `docker-compose.yml` для описания приложений и `docker-compose-monitoring.yml` для описания мониторинга.
 - В мониторинг добавлен `cAdvisor`. Соответственно обновлен файл `prometheus.yml`. Пересобран образ Prometheus.
 - В мониторинг добавлена `Grafana`. Импортирован источник данных и дашборд `DockerMonitoring`.
 - Созданы собственные дашборды `UI_Service_Monitoring` и `Business_Logic_Monitoring`
 - В мониторинг добавлен `Alertmanager` с настроенными уведомлениями в Slack. В Prometheus добавлен конфиг алертов `alerts.yml`. Отредактирован `prometheus.yml`. Соответственно пересобран образ.

### Дополнительное задание 1:

 - `Makefile` дополнен билдами и публикациями добавленных образов. Будет обновлятся по мере выполнения дальнейших дополнительных заданий.
 - Включен экспериментальный режим отдачи метрик Docker. Сбор метрик добавлен в Prometheus. В Grafana добавлен дашборд для этого источника данных. Дашбор выгружен в `monitoring/grafana/dashboards`.
 - Добавлен сбор метрик с Docker демона и контейнеров через `Telegraf`. Сбор метрик добавлен в Prometheus. В Grafana добавлен дашборд для этого источника данных. Дашбор выгружен в `monitoring/grafana/dashboards`.
 - Реализован алерт на 95 процентиль времени ответа UI в `prometheus/alerts.yml`.
 - Настроена интеграция Alertmanager с Gmail.

### Дополнительное задание 2:

 - Реализован автоматический провижен источника данных и дашбордов в Grafana.
 - Реализован сбор метрик с Yandex Monitoring (Stackdriver применим к Google, но мы в Яндексе :> ).
 Получена информация об утилизации cpu, disk r/w, disk iops, network.
 - Добавлена новая метрика в код приложения `ui_unique_session_count`, отображает количество уникальных посещений на основе User-Agent.

### Дополнительное задание 3:

 - Реализована схема проксирования запросов от Grafana к Prometheus через Trickster.
 Теперь Prometheus доступен через порт `8480`. Внесены изменения в дата сорс Grafana, она обращается к `http://trickster:8480`. Trickster также добавлен в Prometheus для сбора его метрик.


## Домашнее задание №22 - logging-1.

### Основное задание:

 - Собраны образы с тэгом logging.
 - Создан compose-файл для системы логирования `docker-compose-logging.yml`.
 - Создан Dockerfile для Fluentd. Создан файл конфигурации Fluentd. Собран образ Fluentd.
 - В `docker-compose.yml` настроена отправка логов во Fluentd для сервиса `post`.
 - Создан индекс в Kibana.
 - В конфиг Fluentd добавлен фильтр для парсинга логов сервиса post.
 - В `docker-compose.yml` настроена отправка логов во Fluentd для сервиса `ui`.
 - В конфиг Fluentd добавлен фильтр для парсинга логов сервиса ui с помощью grok-шаблонов.
 - В `docker-compose-logging.yml` добавлен сервис распределенного трейсинга Zipkin.
 - В `docker-compose.yml` добавлено включение Zipkin для приложения через переменную окружения.

### Дополнительное задание 1:

 - В конфиге Fluentd изменен фильтр для парсинга логов сервиса ui с помощью grok-шаблонов. В одном фильтре разбираются два формата логов ui-сервиса.

### Дополнительное задание 2:

 - Исправлена ошибка при формировании тела запроса к Zipkin.
 - В post-сервисе в функции `find_post()` найдена причина замедленной загрузки - `time.sleep(3)`.


## Домашнее задание №23 - kubernetes-1.

### Основное задание:

 - Созданы файлы манифестов нашего приложения.
 - Подняты две виртуалки в Yandex Cloud.
 - Установлен `Docker`.
 - Установлен `Kubernetes` при помощи утилиты `kubeadm`.
 - Инициализирован кластер.
 - Установлен сетевой плагин `Calico`.
 - Запущены поды нашего приложения.

### Дополнительное задание 1:

 - Установка кластера описана с помощью `Terraform` и `Ansible`.


## Домашнее задание №24 - kubernetes-2.

### Основное задание:

 - Установлен `Minikube`.
 - Созданы деплойменты приложения.
 - Созданы сервисы для коммуникации подов приложения.
 - Приложение запущено в `Minikube` в `dev` окружении.
 - Информация об окружении добавлена в `ui` контейнер.
 - Развернут кластер в Yandex Cloud Managed Service for kubernetes.
 - Приложения задеплоены в `dev` окружение в кластер в Yandex Cloud.
![picture 1](kubernetes/images/67ae6e71a64a51a358e73f0cbeb2e05ebe77b7ea17a9fa33e7932b5eeeb6a11e.png)


### Дополнительное задание 1:

 - Kubernetes кластер развернут в Yandex Cloud с помощью Terraform.
 - Манифесты для поднятия Dashboard лежат в каталоге `kubernetes/dashboard`
