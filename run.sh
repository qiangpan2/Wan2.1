#1 FA use local wheel py12 6.4
pip install --no-deps flash_attn-2.0.4-cp312-cp312-linux_x86_64.whl

#2 MIOPEN build
git clone --no-checkout --filter=blob:none https://github.com/qiangpan2/rocm-libraries.git
cd rocm-libraries
git sparse-checkout init --cone
git sparse-checkout set projects/miopen
git checkout develop

export MIOPEN_ENABLE_LOGGING=1
export MIOPEN_ENABLE_LOGGING_CMD=1
export MIOPEN_LOG_LEVEL=6
python generate.py  --task t2v-1.3B --size 832*480  --ckpt_dir ./Wan2.1-T2V-1.3B  --offload_model True --t5_cpu --sample_shift 8 --sample_guide_scale 6  --prompt "Two anthropomorphic cats in comfy boxing gear and bright gloves fight intensely on a spotlighted stage." > output.log  2>&1
