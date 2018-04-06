## Users

### Create User end-point

curl -H "Content-Type: application/json" -X POST -d '{ "user": { "email": "testing@email.com", "password": "password10" } }' http://voiceable.herokuapp.com/users.json

## Recordings

### Index end-point

curl -s http://voiceable.herokuapp.com/api/respira/v1/recordings | jq

### Show end-point

curl -s http://voiceable.herokuapp.com/api/v1/recordings/1 | jq

### Update end-point

curl -i -X PATCH                                           \
       -H 'Content-Type: application/json'                 \
       -H 'X-User-Email: testing@email.com'               \
       -H 'X-User-Token: FV1qtr6xNLUeDVZWf4bx'             \
       -d '{ "recording": { "data": "Some new Jason as string", "description": "Whatever new" } }' \
       http://voiceable.herokuapp.com/api/respira/v1/recordings/1 
  
### Create end-point    
       
curl -i -X POST                                                              \
    -H 'Content-Type: application/json'                                      \
    -H 'X-User-Email: testing@email.com'                                    \
    -H 'X-User-Token: FV1qtr6xNLUeDVZWf4bx'                                  \
    -d '{ "recording": { "data": "Some Jason as string", "description": "Whatever" } }' \
    http://voiceable.herokuapp.com/api/respira/v1/recordings