Convenient solution for monitoring resources on localhost

1) Using docker compose:
Run:
```docker compose up -d```

Check status:
```docker compose ps -a```
![img.png](readme_images/img.png)

Access UI:
Prometheus: http://localhost:9090/targets
![img.png](readme_images/img3.png)

Grafana: http://localhost:3000 (admin/admin123)

![img.png](readme_images/img2.png)

Cadvisor UI: http://localhost:8080/

![img1.png](readme_images/img1.png)

Node Exporter: http://localhost:9100/metrics
![img.png](readme_images/img4.png)

2) using vagrant:
```vagrant up```
