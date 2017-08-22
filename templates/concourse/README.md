## Concourse CI/CD

Configuration as code pipeline driven continous integration and delivery server.


#### Windows Workers


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
