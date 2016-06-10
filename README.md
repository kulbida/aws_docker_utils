#### This is WIP

===

####Usage:

##### Installation:
```bash
gem install aws_docker_utils
```
#### Configuration (optional, unless EC2 instance has attached roles/policies to access resources w/o credentials)

The preferred way to execute this script on the machine that already has role and policies attached using IAM. This conforms to the best AWS practices and makes your setup more stable against security threat. But to be flexible, it is possible to configure this script to use any AWS credentials:

##### Set AWS credentials:
```bash
aws_docker_utils configure init
```

#####Reset (delete) stored AWS credentials:
```bash
aws_docker_utils configure reset
```
#####Create SQL from Docker container and upload SQL file to AWS S3:
```bash
aws_docker_utils backup_file from \<container_name\> to \<s3_bucket_name\> as 'backup_database' using \<cmd\>
```

#####Example:
```bash
aws_docker_utils backup_file from database to 'my-super-bucket-name' as 'backup' using "pg_dump -U postgres -O my_app_production"
```

The SQL backup file will be extacted from the database container, compressed and pushed to 'my-super-bucket-name' S3 bucket with the name like
```bash
backup_16-04-15_16-34.sql
```

If the AWS S3 bucket does not exist, it will be created.

#####License
Author: Bogdan Kulbida, under MIT Lic. 2016.
