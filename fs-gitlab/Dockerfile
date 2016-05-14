FROM gitlab/gitlab-ce:latest

ENV GITLAB_OMNIBUS_CONFIG gitlab_rails['omniauth_providers'] = [ { "name" => "github", "app_id" => "49ee61869aa2135595a0", "app_secret" => "70caeff3023a868d80b80a846ecbccb5d3b040b2", "args" => { "scope" => "user:email" } } ]

COPY ./111111_gitlab_backup.tar /var/opt/gitlab/backups/111111_gitlab_backup.tar

ONBUILD RUN gitlab-rake gitlab:backup:restore BACKUP=111111 force=yes

