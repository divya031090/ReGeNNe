# ReGeNNe

**Introduction**

The proposed framework aims at combining genetic data into pathway structure and using an ensemble of Convolutional Neural Networks (CNN) along with a Canonical Correlation Regularizer layer for comprehensive prediction of disease risk. 



Information provided by this repository

**Dataset: **

Datasets used can be downloaded from TCGA repository https://www.cancer.gov/about-nci/organization/ccg/research/structural-genomics/tcga. 

1) **Kidney cancer dataset**: https://xenabrowser.net/datapages/?cohort=TCGA%20Kidney%20Clear%20Cell%20Carcinoma%20(KIRC)&removeHub=https%3A%2F%2Fxena.treehouse.gi.ucsc.edu%3A443

Kidney cancer dataset where the outcome space consisted of 945 subjects with 553 subjects with early stage kidney cancer (Stage I and II) and 392 with late stage kidney cancer (Stage III and IV). Our algorithm aimed at classifying early or late stage kidney cancer based on their genetic and pathway information.

2) **Liver Cancer dataset**: https://xenabrowser.net/datapages/?cohort=TCGA%20Liver%20Cancer%20(LIHC)&removeHub=https%3A%2F%2Fxena.treehouse.gi.ucsc.edu%3A443

In this dataset we aimed at differentiating between the cancer type (liver/ kidney) based on the genetic data. We combined the samples from the liver and kidney cancer dataset to create a combined cohort of subjects. In this dataset we had a total of 1383 subjects with 945 subjects for kidney cancer and 438 for liver cancer.

3) **Ovarian Cancer dataset**: https://xenabrowser.net/datapages/?cohort=TCGA%20Ovarian%20Cancer%20(OV)&removeHub=https%3A%2F%2Fxena.treehouse.gi.ucsc.edu%3A443

In this study, the outcome space comprised of 362 subjects with overall survival at 2 years. We split the patients into alive and deceased groups with respect to their survival status. 


**The code is arranged as follows:**

Canonical Correlation Analysis based fusion is provided in CCA_gene.py and gene_fusion.py. For fusion/ ensembling of the features obtained from individ- ual pathways we incorporate a Canonical Correlation regularization layer 


The Convolutional Neural Network framework is presented in startified_CNN.py along with train_test.py for splitting the dataset. In this step, firstly, the individual genes are mapped to their respective pathways and given as input to CNN models. 

Feature importance through shapley values or integrated gradient can be computed using the file importance.py

Pathway mapping.R can be used for pathway mapping to genes and common genes between pathways.




**Prerequisites**

1. Python 2.7

2. CUDA

3. cuDNN

4. Conda

5. TensorFlow

6. NumPy pandas

7. Keras
