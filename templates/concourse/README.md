## Concourse CI/CD

Configuration as code pipeline driven continous integration and delivery server.

### Before you start

#### On your rancher host

You need to run the following two scripts in the same path you'll provide in the questions below.


```bash
# ./generate-tsa-keys.sh

cd /mnt/Data/Concourse

mkdir -p keys/tsa
ssh-keygen -t rsa -f ./keys/tsa/tsa_host_key -N ''
ssh-keygen -t rsa -f ./keys/tsa/session_signing_key -N ''
```

```bash
# ./generate-worker-keys.sh

WORKER_ID=[[ -n "${1}" ]] && "worker-${1}" || "worker-local"
mkdir -p keys/${WORKER_ID}
ssh-keygen -t rsa -f ./keys/${WORKER_ID}/worker_key -N ''
cat ./keys/${WORKER_ID}/worker_key.pub  >> ./keys/tsa/authorized_worker_keys
cp ./keys/tsa/tsa_host_key.pub ./keys/${WORKER_ID}
```

```bash

$ ./generate-tsa-keys.sh
$ ./generate-worker-keys.sh
```

#### Adding more workers

1. generate a new set of keys.
```bash
$ ./generate-tsa-keys.sh windows-1
```

2. copy the `./keys/worker-windows-1` directory to your workers machine
3. launch the worker, telling it where the keys are:

```
PS> $CONCOURSE_TSA_URL="foo.bar.local"

PS> $CONCOURSE_WORKER_IP=$(ipconfig | where {$_ -match 'IPv4.+\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' } | out-null; $Matches[1])

PS> concourse worker `
  --work-dir ./work `
  --peer-ip $CONCOURSE_WORKER_IP`
  --tsa-host=$CONCOURSE_TSA_URL `
  --tsa-public-key ./keys/tsa_host_key.pub `
  --tsa-worker-private-key ./keys/worker_key

```
