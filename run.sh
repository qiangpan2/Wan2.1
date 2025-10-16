export MIOPEN_ENABLE_LOGGING=1
export MIOPEN_ENABLE_LOGGING_CMD=1
export MIOPEN_LOG_LEVEL=6
#py12 6.4

python generate.py  --task t2v-1.3B --size 832*480  --ckpt_dir ./Wan2.1-T2V-1.3B  --offload_model True --t5_cpu --sample_shift 8 --sample_guide_scale 6  --prompt "Two anthropomorphic cats in comfy boxing gear and bright gloves fight intensely on a spotlighted stage." > output.log  2>&1
