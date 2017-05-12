## Users

### Create User end point [NOT WORKING]

curl -H "Content-Type: application/json" -X POST -d '{ "user": { "email": "testing@email.com", "password": "password10" } }' http://localhost:3000/users.json

## Recordings

### Index 

curl -s http://localhost:3000/api/respira/v1/recordings | jq

### Show 

curl -s http://localhost:3000/api/v1/restaurants/1 | jq

### Update

curl -i -X PATCH                                           \
       -H 'Content-Type: application/json'                 \
       -H 'X-User-Email: jordi@voiceable.io'               \
       -H 'X-User-Token: 89yqBCrJhPrAwrLohzjr'             \
       -d '{ "recording": { "description": "New name" } }' \
       http://localhost:3000/api/respira/v1/recordings/1 