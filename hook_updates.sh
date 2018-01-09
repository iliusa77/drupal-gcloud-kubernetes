#!/bin/bash

export pod_name=$(kubectl get pods --show-all=false -o name | grep drupal-prod | cut -f2 -d '/')
#kubectl exec $pod_name -it -c drupal -- drush -r /opt/bitnami/drupal drush -u 1 sql-query "INSERT INTO users (uid,  langcode, uuid) VALUES (0, "en", "");"
kubectl exec $pod_name -it -c drupal -- drush -r /opt/bitnami/drupal dl devel mayo -y
kubectl exec $pod_name -it -c drupal -- drush -r /opt/bitnami/drupal en devel devel_generate mayo -y
kubectl exec $pod_name -it -c drupal -- drush -r /opt/bitnami/drupal config-set system.theme default mayo -y
#kubectl exec $pod_name -it -c drupal -- drush -r /opt/bitnami/drupal generate-content 50 10