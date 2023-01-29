sudo -u ubuntu mkdir -p /home/ubuntu/models_downloads
cd /home/ubuntu/models_downloads

# download the SD model v2.1 and move it to the SD model directory
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/stabilityai/stable-diffusion-2-1
sudo -u ubuntu git clone --depth 1 https://huggingface.co/stabilityai/stable-diffusion-2-1-base
sudo -u ubuntu git clone --depth 1 https://huggingface.co/runwayml/stable-diffusion-v1-5
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/runwayml/stable-diffusion-inpainting
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/prompthero/openjourney-v2
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/dreamlike-art/dreamlike-diffusion-1.0
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/nitrosocke/Nitro-Diffusion
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/andite/anything-v4.0
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/wavymulder/portraitplus
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/dreamlike-art/dreamlike-photoreal-2.0
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/darkstorm2150/Protogen_v2.2_Official_Release
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/darkstorm2150/Protogen_x3.4_Official_Release
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/darkstorm2150/Protogen_v2.2_Official_Release
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/darkstorm2150/Protogen_x5.8_Official_Release
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/darkstorm2150/Protogen_Nova_Official_Release
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/darkstorm2150/Protogen_Dragon_Official_Release
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/darkstorm2150/Protogen_Eclipse_Official_Release
#sudo -u ubuntu git clone --depth 1 https://huggingface.co/darkstorm2150/Protogen_Infinity_Official_Release

cd stable-diffusion-2-1-base/
sudo -u ubuntu git lfs pull --include "v2-1_512-ema-pruned.ckpt"
mv v2-1_512-ema-pruned.ckpt ../../stable-diffusion-webui/models/Stable-diffusion/
wget https://raw.githubusercontent.com/Stability-AI/stablediffusion/main/configs/stable-diffusion/v2-inference.yaml
cp v2-inference.yaml ../../stable-diffusion-webui/models/Stable-diffusion/v2-1_512-ema-pruned.yaml
cd ..

cd stable-diffusion-v1-5
sudo -u ubuntu git lfs pull --include "v1-5-pruned-emaonly.safetensors,v1-5-pruned.safetensors"
mv *.safetensors ../../stable-diffusion-webui/models/Stable-diffusion/
cp v1-inference.yaml ../../stable-diffusion-webui/models/Stable-diffusion/v1-5-pruned-emaonly.yaml
cp v1-inference.yaml ../../stable-diffusion-webui/models/Stable-diffusion/v1-5-pruned.yaml
cd ..

# More Models ...