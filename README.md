1) Using docker compose:

Run:
```docker compose up -d```

Check status:
```docker compose ps -a```
![img.png](readme_images/img.png)

Access UI:
Prometheus: http://localhost:9090/targets

Grafana: http://localhost:3000 (admin/admin123)

Node Exporter: http://localhost:9100/metrics

Cadvisor UI: http://localhost:8080/

![img1.png](readme_images/img1.png)

2) using vagrant:
```vagrant up```
