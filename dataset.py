import torch.utils.data
import numpy as np, h5py
import random


def CreateDatasetSynthesis(phase, input_path, contrast1 = 'contrast1', contrast2 = 'contrast2'):

    target_file = input_path + "/data_{}_{}.mat".format(phase, contrast1)
    data_fs_s1=LoadDataSet(target_file, contrast1)

    target_file = input_path + "/data_{}_{}.mat".format(phase, contrast2)
    data_fs_s2=LoadDataSet(target_file, contrast2)

    dataset=torch.utils.data.TensorDataset(torch.from_numpy(data_fs_s1),torch.from_numpy(data_fs_s2))
    return dataset

#Dataset loading from load_dir and converintg to 256x256
def LoadDataSet(load_dir, contrast, variable = 'data_fs', padding = True, Norm = True):
    f = h5py.File(load_dir,'r')
    if contrast == "contrast1":
        variable = 'MR_img_list'
    elif contrast == "contrast2":
        variable = 'CT_img_list'
    if np.array(f[variable]).ndim==3:
        data = np.transpose(np.array(f[variable]), (2, 0, 1))
        data=np.expand_dims(np.transpose(data,(0,2,1)),axis=1)
    else:
        data=np.transpose(np.array(f[variable]),(1,0,3,2))
    data=data.astype(np.float32)
    if padding:
        pad_x=int((256-data.shape[2])/2)
        pad_y=int((256-data.shape[3])/2)
        print('padding in x-y with:'+str(pad_x)+'-'+str(pad_y))
        data=np.pad(data,((0,0),(0,0),(pad_x,pad_x),(pad_y,pad_y)))
    if Norm:
        data=(data-0.5)/0.5
    return data
