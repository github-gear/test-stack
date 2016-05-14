FROM gitlab/gitlab-ce:latest

ENV GITLAB_OMNIBUS_CONFIG gitlab_rails['omniauth_providers'] = [ { "name" => "github", "app_id" => "49ee61869aa2135595a0", "app_secret" => "70caeff3023a868d80b80a846ecbccb5d3b040b2", "args" => { "scope" => "user:email" } } ]

ENV BACKUP_TIMESTAMP 111111
ENV DEFAULT_BACKUP_FILE ${BACKUP_TIMESTAMP}_gitlab_backup.tar
ENV BACKUP_PATH /var/opt/gitlab/backups
COPY ./${DEFAULT_BACKUP_FILE} ${BACKUP_PATH}/${DEFAULT_BACKUP_FILE}
