kubectl delete namespace maple-topazelite-corda-network 


kubectl delete namespace maple-topazelite-webservers-nodes

psql "host=34.89.62.202 port=5432 sslmode=disable dbname=postgres password=123qwer user=postgres"



drop database doorman WITH (FORCE);

create database doorman owner postgres;

drop database contractor_a_corda WITH (FORCE);

create database contractor_a_corda owner postgres;

drop database developer_a_corda WITH (FORCE);

create database developer_a_corda owner postgres;

drop database notary WITH (FORCE);

create database notary owner postgres;

drop database settelment_bank WITH (FORCE);

create database settelment_bank owner postgres;


kubectl exec -it corda-node-contractor-0  -n maple-topazelite-webservers-nodes -- sh

kubectl exec -it corda-node-developer-0  -n maple-topazelite-webservers-nodes -- sh


apt update && apt install -y ssh sshpass
sshpass -p "123456" ssh -p 2222 localhost -l corda_rpc -o StrictHostKeyChecking=no
run networkMapSnapshot

start Ping arg0: "CN=CK Development Limited, OU=Developer, O=CryptoBLKLimited, L=Singapore, C=SG"

start Ping arg0: "CN=China Construction South Pacific Dev, OU=Contractor, O=China Construction South Pacific Development, L=Singapore, C=SG"

start Ping arg0: "CN=Notary, O=Doorman, L=HongKong, C=CN"


kubectl get service/servicename -o jsonpath='{.spec.clusterIP}'
