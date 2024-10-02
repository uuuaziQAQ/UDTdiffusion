clear;clc
for mode = ["train", "test","val"]
    MR_dir = mode + "A";
    CT_dir = mode + "B";
    
    MR_img_path_list = dir(strcat(MR_dir,'/*.jpg'));
    CT_img_path_list = dir(strcat(CT_dir,'/*.jpg'));
    MR_img_list = zeros([length(MR_img_path_list), 256, 256]);
    CT_img_list = zeros([length(CT_img_path_list), 256, 256]);
    for i = 1:length(MR_img_path_list)
         MR_img_name = MR_img_path_list(i).name;
         MR_img = rgb2gray(imread(strcat(MR_dir,"/",MR_img_name)));
         MR_img = double(MR_img)/255.0;
         MR_img_list(i,:,:) = MR_img;
         CT_img_name = CT_img_path_list(i).name;
         CT_img = rgb2gray(imread(strcat(CT_dir,"/",CT_img_name)));
         CT_img = double(CT_img)/255.0;
         CT_img_list(i,:,:) = CT_img;
    end
    save("data_" + mode + "_contrast1.mat", "MR_img_list", '-v7.3')
    save("data_" + mode + "_contrast2.mat", "CT_img_list", '-v7.3')
%     data_fs = MR_img_list;
%     save("data_" + mode + "_contrast1.mat", "data_fs", '-v7.3')
%     data_fs = CT_img_list;
%     save("data_" + mode + "_contrast2.mat", "data_fs", '-v7.3')
end
% img_path_list = dir(strcat(file_path,'25_*.tif'));
% %dir List file information in the current folder
% img_num = length(img_path_list); %Obtain the total number of images
% fprintf('The image being read is：\n');
% if img_num > 0 %There are images that meet the conditions
%     for j = 1:img_num %Read images one by one
%         img_name = [file_path,'25_',int2str(j),'.tif'];
%         pitch=imread(img_name);%4-color channel
%         fprintf('The%02d one：%s\n',j,img_name);
%     end
% end
