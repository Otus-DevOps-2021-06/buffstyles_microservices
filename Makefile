
BUILD_FILE=docker_build.sh

all: build push

build:	build_comment build_post build_ui build_prometheus \
		build_mongodb_exporter build_blackbox_exporter build_grafana \
		build_alertmanager build_cadvisor build_telegraf build_trickster

build_comment:
	cd src/comment && bash $(BUILD_FILE)

build_post:
	cd src/post-py && bash $(BUILD_FILE)

build_ui:
	cd src/ui && bash $(BUILD_FILE)

build_prometheus:
	cd monitoring/prometheus && bash $(BUILD_FILE)

build_mongodb_exporter:
	cd monitoring/mongodb-exporter && bash $(BUILD_FILE)

build_blackbox_exporter:
	cd monitoring/blackbox-exporter && bash $(BUILD_FILE)

build_grafana:
	cd monitoring/grafana && bash $(BUILD_FILE)

build_alertmanager:
	cd monitoring/alertmanager && bash $(BUILD_FILE)

build_cadvisor:
	cd monitoring/cadvisor && bash $(BUILD_FILE)

build_telegraf:
	cd monitoring/telegraf && bash $(BUILD_FILE)

build_trickster:
	cd monitoring/trickster && bash $(BUILD_FILE)



push: push_comment push_post push_ui push_prometheus \
		push_mongodb_exporter push_blackbox_exporter \
		push_grafana push_alertmanager push_cadvisor \
		push_telegraf push_trickster

push_comment:
	docker push ${USER_NAME}/comment

push_post:
	docker push ${USER_NAME}/post

push_ui:
	docker push ${USER_NAME}/ui

push_prometheus:
	docker push ${USER_NAME}/prometheus

push_mongodb_exporter:
	docker push ${USER_NAME}/mongodb-exporter

push_blackbox_exporter:
	docker push ${USER_NAME}/blackbox-exporter

push_grafana:
	docker push ${USER_NAME}/grafana

push_alertmanager:
	docker push ${USER_NAME}/alertmanager

push_cadvisor:
	docker push ${USER_NAME}/cadvisor

push_telegraf:
	docker push ${USER_NAME}/telegraf

push_trickster:
	docker push ${USER_NAME}/trickster
