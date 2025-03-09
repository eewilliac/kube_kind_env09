# Add Docker's official GPG key:
RED='\033[0;31m'
echo -e "${RED}update the box"
sudo apt-get -y update 
echo -e "${RED}install ca-certificates and curl"
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
echo -e "${RED}download docker gpg"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
NC='\033[0m' # No Color
echo -e "${NC}"
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG docker vagrant
newgrp docker
echo -e "${RED}install golang and updates"
echo -e "${NC}"
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get -y update
sudo apt-get -y install golang-go
sudo apt-get update && apt-get install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update && apt-get install -y python3.13 python3.13-dev
sudo apt-get update && apt-get install -y python3-pip
sudo apt install -y python3-pip
echo -e "${RED}install KIND Kubernetes"
echo -e "${NC}"
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
echo -e "${RED}install kubectl"
echo -e "${NC}"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl