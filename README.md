# UDTdiffusion
UDTdiffusion: A Pseudo-Condition Guided Adversarial Fast Diffusion Model for Unpaired Medical Image Translation

After the article is accepted, we will provide trained PTH weight files for researchers to reproduce the test results
# Dependencies
	python>=3.6.9
	torch>=1.7.1
	torchvision>=0.8.2
	cuda=>11.2
	ninja
	python3.x-dev (apt install, x should match your python3 version, ex: 3.8)
# Installation
	git clone https://github.com/uuuaziQAQ/UDTdiffusion
	cd UDTdiffusion
# Dataset
	input_path/
	── data_train_contrast1.mat
	── data_train_contrast2.mat
	── data_val_contrast1.mat
	── data_val_contrast2.mat
  	── data_test_contrast1.mat
  	── data_test_contrast2.mat
where .mat files has shape of (#images, width, height) and image values are between 0 and 1.0.

You can use file make_mat.m to convert the .jpg images to .mat format
# Test
	python test.py --image_size 256 --exp UDT --num_channels 2 --num_channels_dae 64 --ch_mult 1 1 2 2 4 4 --num_timesteps 4 --num_res_blocks 2 --batch_size 1 --embedding_type positional  --z_emb_dim 256 --contrast1 contrast1  --contrast2 contrast2 --which_epoch 100 --gpu_chose 1 --input_path breast --output_path results
