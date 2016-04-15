#### This is WIP


#####Usage:

```bash
aws_docker_utils backup_file from \<container_name\> to \<s3_bucket_name\> as 'backup_database' using \<cmd\>
```

#####Example:
```bash
aws_docker_utils backup_file from database to 'my-super-bucket-name' as 'backup' using "pg_dump -U postgres -O my_app_production"
```

The SQL backup file will be extacted from the database container, compressed and pushed to 'my-super-bucket-name' S3 bucket with the name like
```bash
backup_16-04-15_16-34.sql.tar.gz
```

If the AWS S3 bucket is not exists, it will be created.
