# Solutions for DE zoomcamp 2024 course.

## Week 1

### SQL tasks

Solutions for `SQL` tasks are in week_01/sql_tasks directory. To run it use docker-compose. It will build and start 3 containers:
* `postgres` -- official database image
* `prepare_data` -- to extract data from csvs to db (syncronized to run after `postgres` has started and is accessible)
* `queries_runner` -- runs sql queries for tasks 3-6. Syncronized to run after `prepare_data` by dummy volume `sync_volume` 

`queries_runner` prints results of the queries to docker log.

To run docker compose, create a file with env variables `.env` as follows or similiar:

```
POSTGRES_USER: root
POSTGRES_PASSWORD: 12345
POSTGRES_HOST: postgres
POSTGRES_PORT: 5432
POSTGRES_DB: ny_taxi
```
and run `docker-compose up`

There is a supplemental `docker-compose.dev.yml` containing `pgadmin`. It can be used for debugging purposes.
To run it use `docker-compose -f docker-compose.dev.yml -f docker-compose.yml up`. Don't forget to do `docker-compose build` in case of changing any part of the project.

### Terraform tasks

Sollutions for `Terraform` tasks. To run create a project on Google Cloud and run `terraform apply -var="project=<PROJECT ID>"`. Also some other variables can be specified.
To destroy do `terraform destroy -var="project=<PROJECT ID>"`