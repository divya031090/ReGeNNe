# ReGeNNe
The proposed framework aims at combining genetic data into pathway structure and using an ensemble of Convolutional Neural Networks (CNN) along with a Canonical Correlation Regularizer layer for comprehensive prediction of disease risk. 

Datasets used: can be downloaded from TCGA repository https://www.cancer.gov/about-nci/organization/ccg/research/structural-genomics/tcga. 

The files for Canonical Correlation Analysis based fusion are: CCA_gene.py and gene_fusion.py. The Convolutional Neural Network framework is presented in startified_CNN.py along with train_test.py for splitting the dataset. Pathway mapping.R can be used for pathway mapping to genes and common genes between pathways.


Prerequisites

Python 2.7

CUDA

cuDNN

Conda

TensorFlow

NumPy pandas

Keras
