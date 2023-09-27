#!/bin/bash


# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get -y install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y 

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker ubuntu

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo cat > config.yaml << EOL
ui:
  header: "Test Connectivity via Distributed Firewall"
  title: "Test Connectivity via Distributed Firewall"
endpoints:
  - name: www.google.com
    url: "https://www.google.com"
    interval: 5s
    group: Internet
    conditions:
      - "[STATUS] == 200"
  - name: www.facebook.com
    url: "https://www.facebook.com"
    interval: 5s
    group: Internet
    conditions:
      - "[STATUS] == 200"
  - name: www.amazon.com
    url: "https://www.amazon.com"
    interval: 5s
    group: Internet
    conditions:
      - "[STATUS] == 200"
  - name: ICMP (aws-ubnt66-priv-prod01)
    url: "icmp://10.66.0.14"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[CONNECTED] == true"
  - name: HTTP (aws-ubnt66-priv-prod01)
    url: "http://ip-10-66-0-14.eu-west-2.compute.internal"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[STATUS] == 200"
  - name: ICMP (aws-ubnt66-priv-prod02)
    url: "icmp://10.66.0.20"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[CONNECTED] == true"
  - name: HTTP (aws-ubnt66-priv-prod02)
    url: "http://ip-10-66-0-20.eu-west-2.compute.internal"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[STATUS] == 200"
  - name: ICMP (aws-win66-pub-jumpsrv-prod01)
    url: "icmp://10.66.0.40"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[CONNECTED] == true"
  - name: ICMP (aws-ubnt-priv-dev01)
    url: "icmp://10.67.0.14"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[CONNECTED] == true"
  - name: ICMP (aws-win67-priv-dev01)
    url: "icmp://10.67.0.13"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[CONNECTED] == true"
  - name: HTTP (aws-win67-priv-dev01)
    url: "http://ip-10-67-0-13.eu-west-2.compute.internal"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[STATUS] == 200"
  - name: ICMP (az-ubnt56-priv-prod01)
    url: "icmp://10.56.0.36"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[CONNECTED] == true"
  - name: ICMP (az-win56-pub-prod01)
    url: "icmp://10.56.0.4"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[CONNECTED] == true"
  - name: HTTP (az-win56-pub-prod01)
    url: "http://10.56.0.4"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[STATUS] == 200"
  - name: ICMP (az-ubnt-priv-dev01)
    url: "icmp://10.57.0.36"
    group: Aviatrix Network
    interval: 5s
    conditions:
      - "[CONNECTED] == true"
client:
  insecure: false
EOL
sudo docker run -d --restart unless-stopped --name gatus -p 80:8080 --mount type=bind,source="$(pwd)"/config.yaml,target=/config/config.yaml twinproduction/gatus

