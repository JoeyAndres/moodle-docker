IMAGE=moodle # Set this as the name of the docker image.
CONTAINER=${IMAGE}  # Doesn't have to be this way. Set this to whatever you want to name the container.
MOODLE_DIR=/home/jandres/gsoc/moodle

# Change the port to the desired port in case there are conflicts.
MEMCACHED_PORT=11211
PGSQL_PORT=5432
APACHE_PORT=80

build:
	docker build -t ${IMAGE} .

run:
	docker run \
	-e POSTGRES_USER=moodle \
	-e POSTGRES_DB=moodle \
	-e POSTGRES_PASSWORD=P@ssw0rd1 \
	-p ${PGSQL_PORT}:5432 \
	-p ${APACHE_PORT}:80 \
	-v ${MOODLE_DIR}:/moodle \
	--name ${CONTAINER} \
	-d ${IMAGE}
