Link

- df_test.csv: https://drive.google.com/file/d/1DemsHaDvM3xRrgHLBju3wzmX1UvpbXEo/view?usp=drive_link
- df_train.cvs: https://drive.google.com/file/d/14dA2OvIzMlLxyW-X17AcSLToq-9sAbK3/view?usp=drive_link

The dataset in question is the CIC-IDS-2018, which is available at https://www.unb.ca/cic/datasets/ids-2018.html. Feature extraction was performed by the dataset providers. This dataset encompasses traffic data spanning 10 days and is categorized into 7 unique labels. 'Benign' signifies normal activities, whereas the remaining labels represent malicious activities. Post feature extraction, the data was organized into 10 CSV files, totaling 6.41GB.

The pre-processing, or data cleaning, stage utilized methods as outlined in https://www.kaggle.com/code/mohamedahmedae/ddql-rl-multi-classfication. The process involved amalgamating the original ten files into a single file named `df_train.csv`, effectively reducing the dataset's size to 1.55GB.

Subsequently, the model training was executed locally using AutoGluon, as elaborated on https://auto.gluon.ai/stable/index.html. This approach not only simplified the description but also enhanced the performance, surpassing the results previously reported on Kaggle. The model achieved state-of-the-art (SOTA) performance.

The 10-Percent means we only use 10% of the 'csv' files, because we also only use one day's data in other testing, we want to keep it aligned.

