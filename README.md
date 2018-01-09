# A template for deploying Drupal Stack on a Google Сloud Kubernetes cluster

## Usage:

## Automatic deployment (CircleCI)

### Preliminary preparation
#### Create new Google Cloud project and new Kubernetes cluster like this: https://cloud.google.com/kubernetes-engine/docs/quickstart
#### Prepare CircleCI environments like this: https://circleci.com/docs/1.0/continuous-deployment-with-google-container-engine/

### Usage Docker Hub Registry (CircleCI v2.0)
### Rename files: 
 - .circleci/_config.yml --> .circleci/config.yml
 - circle.yml --> _circle.yml
### Setup in setting ofte build in CirclCI dashboard the following variables:
 - ECR_ENDPOINT
 - DOCKERHUB_USER
 - DOCKERHUB_PASSWORD

### Usage Google Container Registry (CircleCI v1.0)
### If before you used Docker Hub Registry rename files: 
  - .circleci/config.yml --> .circleci/_config.yml
  - _circle.yml --> circle.yml
### Setup in circle.yml the following variables:
  - PROJECT_NAME: 
  - PROJECT_ID: 
  - CLUSTER_NAME: 
  - CLOUDSDK_COMPUTE_ZONE: 
  - SITE_NAME: 
  - DATABASE_NAME:
  - SITE_DOCKER_IMAGE: "gcr.io/$PROJECT_NAME/drupal"
  - DATABASE_DOCKER_IMAGE: 
  - DATABASE_DOCKER_TAG: 

## Manual deployment

### Preliminary preparation
#### Create new Google Cloud project and new Kubernetes cluster like this https://cloud.google.com/kubernetes-engine/docs/quickstart
#### Activate Google Cloud Shell

#### Initialize the following variables

 - export SITE_NAME="drupal";
 - export DATABASE_NAME="mariadb"; 
 - export SITE_DOCKER_IMAGE="iliusa77/drupal"; 
 - export SITE_DOCKER_TAG="0.1"; 
 - export DATABASE_DOCKER_IMAGE="iliusa77/mariadb"; 
 - export DATABASE_DOCKER_TAG="0.1"; 

#### Create/Update deployments and services
 - envsubst < kubernetes.yaml | kubectl apply -f -

#### Manual cleanup
 - kubectl delete services,deployments,persistentvolumeclaims --all
