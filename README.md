```docker-compose up -d```

sudo mkdir -p /mnt/wsl
sudo mount --bind / /mnt/wsl
sudo mount --make-shared /mnt/wsl

/etc/wsl.conf
[automount]
options = "metadata,umask=22,fmask=11"c