docker build -t sumitrusia/multi-client:latest -t sumitrusia/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sumitrusia/multi-server:latest -t sumitrusia/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sumitrusia/multi-worker:latest -t sumitrusia/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push sumitrusia/multi-client:latest
docker push sumitrusia/multi-server:latest
docker push sumitrusia/multi-worker:latest

docker push sumitrusia/multi-client:$SHA
docker push sumitrusia/multi-server:$SHA
docker push sumitrusia/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=sumitrusia/multi-client:$SHA
kubectl set image deployments/server-deployment server=sumitrusia/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=sumitrusia/multi-worker:$SHA