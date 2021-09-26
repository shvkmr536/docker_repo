# docker_repo

**Run the shell on jenkins server:**

rsync -avh /var/lib/jenkins/workspace/web-job/Dockerfile root@172.31.78.20:/opt

**Run the commands on ansible:**

cd /opt
docker image build -t $JOB_NAME:v1.$BUILD_ID .
docker image tag $JOB_NAME:v1.$BUILD_ID shvkmr536/$JOB_NAME:v1.$BUILD_ID
docker image tag $JOB_NAME:v1.$BUILD_ID shvkmr536/$JOB_NAME:latest
docker image push shvkmr536/$JOB_NAME:v1.$BUILD_ID
docker image push shvkmr536/$JOB_NAME:latest
docker image rmi $JOB_NAME:v1.$BUILD_ID shvkmr536/$JOB_NAME:v1.$BUILD_ID $JOB_NAME:latest

**Post build:**
Run the command on ansible to deploy the container on docker-host

ansible-playbook /root/sourcecode/docker.yml



