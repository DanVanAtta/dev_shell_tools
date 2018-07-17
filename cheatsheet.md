
### SSH Tunnel

```
function tunnel() {
  PROD_IP=$1
  RROD_PORT=$2
  PROD_USER=$3
  TUNNEL_PORT=$4
  TUNNEL_HOST=$5
  
  ssh -L ${TUNNEL_PORT}:${TUNNEL_HOST}:${PROD_PORT} ${PROD_USER}@${PROD_IP}
}
```
