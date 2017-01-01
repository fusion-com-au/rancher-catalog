## Concourse CI/CD

### Before you start

on your host, you need to run the following script in
the path you will be providing below.

```
mkdir -p keys/tsa keys/worker
ssh-keygen -t rsa -f ./keys/tsa/tsa_host_key -N ''
ssh-keygen -t rsa -f ./keys/tsa/session_signing_key -N ''
ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''
cp ./keys/worker/worker_key.pub ./keys/tsa/authorized_worker_keys
cp ./keys/tsa/tsa_host_key.pub ./keys/worker
```
