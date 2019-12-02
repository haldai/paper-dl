　　该项目的脚本可以批量下载AI领域相关会议的文集，目前支持的网站有
- PMLR：[http://proceedings.mlr.press/](http://proceedings.mlr.press/)
- NIPS：[https://papers.nips.cc/](https://papers.nips.cc/)

## 依赖
　　curl

## 用法
　　下载仓库`git clone https://github.com/murongxixi/download-paper.git`并将该目录添加到$PATH变量中。

　　第一次运行时会自动创建html目录并缓存必要的网页，运行脚本时至少要有一个参数，pmlr.sh为卷号，nips.sh为年份：
```shell
┌─[murongxixi@murongxixi-xps] - [~] - [六 11月 30, 04:56]
└─[$] <> pmlr.sh 97
773 Natural Analysts in Adaptive Data Analysis
772 Fast Context Adaptation via Meta-Learning
771 Beating Stochastic and Adversarial Semi-bandits Optimally and Simultaneously
770 Latent Normalizing Flows for Discrete Sequences
769 Surrogate Losses for Online Learning of Stepsizes in Stochastic Non-Convex Optimization
……
5 Distributed Learning with Sublinear Communication
4 Communication-Constrained Inference and the Role of Shared Randomness
3 MixHop: Higher-Order Graph Convolutional Architectures via Sparsified Neighborhood Mixing
2 Dynamic Weights in Multi-Objective Deep Reinforcement Learning
1 AReS and MaRS Adversarial and MMD-Minimizing Regression for SDEs
==> papers to download (eg: 1 2 3, 1-3 or ^3), default all (773)
==> 67 97-98

1/3 (33.33%) A Kernel Perspective for Regularizing Deep Neural Networks
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  347k  100  347k    0     0  29218      0  0:00:12  0:00:12 --:--:-- 15375
Download supplementary: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  683k  100  683k    0     0  13533      0  0:00:51  0:00:51 --:--:-- 10077

2/3 (66.67%) On Symmetric Losses for Learning from Corrupted Labels
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  706k  100  706k    0     0  13146      0  0:00:55  0:00:55 --:--:--  9593
Download supplementary: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  504k  100  504k    0     0  21951      0  0:00:23  0:00:23 --:--:-- 20634

3/3 (100.00%) Online learning with kernel losses
Paper already exists!
Supplementary already exists!
```

　　此外支持关键词查询：
```
┌─[murongxixi@murongxixi-xps] - [~] - [一 12月 02, 11:07]
└─[$] <> nips.sh 2018 condition gradient  
3 Uncertainty Sampling is Preconditioned Stochastic Gradient Descent on Zero-One Loss
2 Zeroth-order (Non)-Convex Stochastic Optimization via Conditional Gradient and Gradient Updates
1 Gradient Descent Meets Shift-and-Invert Preconditioning for Eigenvector Computation
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (3)
==> ^1

1/2 (50.00%) Zeroth-order (Non)-Convex Stochastic Optimization via Conditional Gradient and Gradient Updates
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  376k  100  376k    0     0   256k      0  0:00:01  0:00:01 --:--:--  256k
Download bib: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   587    0   587    0     0   1122      0 --:--:-- --:--:-- --:--:--  1122
Download Supplemental: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  288k  100  288k    0     0   226k      0  0:00:01  0:00:01 --:--:--  226k
Download reviews: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 12022  100 12022    0     0  28420      0 --:--:-- --:--:-- --:--:-- 28420

2/2 (100.00%) Uncertainty Sampling is Preconditioned Stochastic Gradient Descent on Zero-One Loss
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  376k  100  376k    0     0   257k      0  0:00:01  0:00:01 --:--:--  257k
Download bib: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   587    0   587    0     0   1120      0 --:--:-- --:--:-- --:--:--  1120
Download Supplemental: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  288k  100  288k    0     0   203k      0  0:00:01  0:00:01 --:--:--  203k
Download reviews: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 12022  100 12022    0     0  24434      0 --:--:-- --:--:-- --:--:-- 24385
```