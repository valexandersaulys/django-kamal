# Deploying the "Default" Django App via Kamal

Mostly by following the ["Hello World"
docs](https://kamal-deploy.org/docs/installation). Run on a $4 Digital
Ocean Server (their cheapest offering).  



## ssh issues
```
# get a list of all available keys
ssh-add -l

# then add it (Apple specific)
ssh-add -K ~/.ssh/id_ed25519
```


## Running on $4 DO server

+ very very slow -- often to the point of basically not working
+ often have to release `kamal lock release` -- for some reasons doesn't always do this
+ Will "fail" a health check that is clearly working (see below)

### Failed Healthcheck that does actually pass 
```
  INFO [2ff3cabd] Running docker container ls --all --filter name=^vasaulys-django-demo-web-710a2be7f5db94f6cba9fb61ce720ef0c6a90e63_uncommitted_bcdcdaf5afef04af$ --quiet | xargs docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' on 137.184.0.220
  INFO [2ff3cabd] Finished in 0.626 seconds with exit status 0 (successful).
  INFO container not unhealthy (healthy), retrying in 9s (attempt 9/10)...
  INFO [521ba4f7] Running docker container ls --all --filter name=^vasaulys-django-demo-web-710a2be7f5db94f6cba9fb61ce720ef0c6a90e63_uncommitted_bcdcdaf5afef04af$ --quiet | xargs docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' on 137.184.0.220
  INFO [521ba4f7] Finished in 0.691 seconds with exit status 0 (successful).
  INFO container not unhealthy (healthy), retrying in 10s (attempt 10/10)...
```

Sometimes this matters, sometimes it doesn't 
