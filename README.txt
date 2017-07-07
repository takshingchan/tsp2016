
Polar  n-Complex and n-Bicomplex Singular Value Decomposition and
                   Principal Component Pursuit


                Tak-Shing Chan and Yi-Hsuan Yang
     Music and Audio Computing Lab, Academia Sinica, Taiwan


To reproduce the results of T.-S. T. Chan and Y.-H. Yang,  "Polar
n-complex  and n-bicomplex singular value decomposition and prin-
cipal component  pursuit,"  IEEE  Transactions  on   Signal  Pro-
cessing, 2016, please do the following.

To reproduce the numerical simulations:

1  Download QTFM 2.2 to the "qtfm" directory:
   http://qtfm.sourceforge.net/

2  Download spl2016 to the "spl2016" directory:
   http://mac.citi.sinica.edu.tw/ikala/code/spl2016.zip

3  Run  phasetrans.m  on  MATLAB  R2012b  (as  later versions use
   xGESDD which may not converge in some cases)

To reproduce the experiments:

1  Download the MUS dataset to the "Datasets\MSD100" directory:
   http://corpus-search.nii.ac.jp/sisec/2015/MUS/MSD100_2.zip

2  Download the SMARD dataset to the  "Datasets\smard"  directory
   (we  only need 0020, 0021, 0120, 0121, 1020, 1021, 1120, 1121,
   2020, 2021, 2120, and 2121):
   http://www.smard.es.aau.dk/

3  Run reproduce.m

To use polar n-complex and n-bicomplex principal  component  pur-
suit in your own project:

1  Copy ialm_pbpcp.m, prox.m and tabs.m to your project directory

2  Call ialm_pbpcp from your code

If you find this software useful, please cite our paper.

Tak-Shing Chan
Yi-Hsuan Yang
16 July 2016
