docker build -t jorakhachatryan/multi-client:latest -t jorakhachatryan/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jorakhachatryan/multi-server:latest -t jorakhachatryan/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jorakhachatryan/multi-worker:latest -t jorakhachatryan/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jorakhachatryan/multi-client:latest
docker push jorakhachatryan/multi-server:latest
docker push jorakhachatryan/multi-worker:latest

docker push jorakhachatryan/multi-client:$SHA
docker push jorakhachatryan/multi-server:$SHA
docker push jorakhachatryan/multi-worker:$SHA

kubectl apply -f k8s/
kubectl set image deployments/server-deployment server=jorakhachatryan/multi-server:$SHA
kubectl set image deployments/client-deployment client=jorakhachatryan/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jorakhachatryan/multi-worker:$SHA