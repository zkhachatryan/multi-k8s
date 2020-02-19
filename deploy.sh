docker build -t jorakhachatryan/multi-client -f ./client/Dockerfile ./client
docker build -t jorakhachatryan/multi-server -f ./server/Dockerfile ./server
docker build -t jorakhachatryan/multi-worker -f ./worker/Dockerfile ./worker
docker push jorakhachatryan/multi-client
docker push jorakhachatryan/multi-server
docker push jorakhachatryan/multi-worker
kubectl apply -f k8s/
kubectl set image deployments/server-deployment server=jorakhachatryan/multi-server