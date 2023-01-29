# change to ubuntu home directory
cd /home/ubuntu

## Install Dependencies
# disable the restart dialogue and install several packages
sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
sudo apt-get update
sudo apt install wget git python3 python3-venv build-essential net-tools awscli -y

# install CUDA (from https://developer.nvidia.com/cuda-downloads)
wget https://developer.download.nvidia.com/compute/cuda/12.0.0/local_installers/cuda_12.0.0_525.60.13_linux.run
sudo sh cuda_12.0.0_525.60.13_linux.run --silent

# install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
sudo -u ubuntu git lfs install --skip-smudge

## Install AUTOMATIC1111 + Extensions
# install AUTOMATIC1111
sudo -u ubuntu git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
sudo -u ubuntu pip install -r requirements_versions.txt

# install AUTOMATIC1111 Extensions
cd stable-diffusion-webui/extensions

# install dreambooth
sudo -u ubuntu git clone https://github.com/d8ahazard/sd_dreambooth_extension.git
cd stable-diffusion-webui/extensions/sd_dreambooth_extension
sudo -u ubuntu pip install -r requirements.txt

# install system-info
sudo -u ubuntu git clone https://github.com/vladmandic/sd-extension-system-info.git

# install smart_process
sudo -u ubuntu git clone https://github.com/d8ahazard/sd_smartprocess
cd stable-diffusion-webui/extensions/sd_smartprocess
sudo -u ubuntu pip install -r requirements.txt

# More Extensions ...

## Download and Install Models
# download the SD model v2.1 and move it to the SD model directory
sudo -u ubuntu git clone --depth 1 https://huggingface.co/stabilityai/stable-diffusion-2-1-base
cd stable-diffusion-2-1-base/
sudo -u ubuntu git lfs pull --include "v2-1_512-ema-pruned.ckpt"
sudo -u ubuntu git lfs install --force
cd ..
mv stable-diffusion-2-1-base/v2-1_512-ema-pruned.ckpt stable-diffusion-webui/models/Stable-diffusion/
rm -rf stable-diffusion-2-1-base/
wget https://raw.githubusercontent.com/Stability-AI/stablediffusion/main/configs/stable-diffusion/v2-inference.yaml
cp v2-inference.yaml stable-diffusion-webui/models/Stable-diffusion/v2-1_512-ema-pruned.yaml

## Finish and start StableDiffusion
# change ownership of the web UI so that a regular user can start the server
sudo chown -R ubuntu:ubuntu stable-diffusion-webui/

# TODO: Start this with Supervisord so it's always up even if it crashes
# start the server as user 'ubuntu'
sudo -u ubuntu nohup bash stable-diffusion-webui/webui.sh --listen > log.txt

