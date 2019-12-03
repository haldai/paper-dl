　　批量下载AI领域相关会议的文集，目前支持的网站有
- PMLR：[http://proceedings.mlr.press/](http://proceedings.mlr.press/)
- NIPS：[https://papers.nips.cc/](https://papers.nips.cc/)

## 依赖
- curl：下载
- unzip：解压缩附件
- perl：正则表达式非贪婪匹配
- ghostscript：合并pdf，pdftk很坑

## 用法
　　下载`git clone https://github.com/murongxixi/download-paper.git`并将该目录添加到$PATH变量中。

　　第一次运行时会自动创建html目录并缓存必要的网页，运行脚本时至少要有一个参数，pmlr.sh为卷号，nips.sh为年份。如果有附录，会自动合并正文和附录：
```shell
┌─[murongxixi@murongxixi-xps] - [~] - [二 12月 03, 11:37]
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
100  347k  100  347k    0     0   6983      0  0:00:51  0:00:51 --:--:--  3792
Download supplementary: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  683k  100  683k    0     0   3223      0  0:03:37  0:03:37 --:--:--  4955
Merge: bietti19a-merge.pdf

2/3 (66.67%) On Symmetric Losses for Learning from Corrupted Labels
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  706k  100  706k    0     0   7166      0  0:01:41  0:01:41 --:--:--  7751
Download supplementary: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  504k  100  504k    0     0   8406      0  0:01:01  0:01:01 --:--:-- 11089
Merge: charoenphakdee19a-merge.pdf

3/3 (100.00%) Online learning with kernel losses
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  353k  100  353k    0     0   9070      0  0:00:39  0:00:39 --:--:--  9440
Download supplementary: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  600k  100  600k    0     0   9660      0  0:01:03  0:01:03 --:--:-- 15667
Merge: chatterji19a-merge.pdf
```

　　此外支持关键词查询：
```
┌─[murongxixi@murongxixi-xps] - [~] - [二 12月 03, 11:45]
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
100  376k  100  376k    0     0   173k      0  0:00:02  0:00:02 --:--:--  173k
Download bib: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   587    0   587    0     0   1124      0 --:--:-- --:--:-- --:--:--  1122
Download supplemental: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  288k  100  288k    0     0   155k      0  0:00:01  0:00:01 --:--:--  155k
Download review: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 12022  100 12022    0     0  29250      0 --:--:-- --:--:-- --:--:-- 29179
Unzip and merge: 7605-zeroth-order-non-convex-stochastic-optimization-via-conditional-gradient-and-gradient-updates-merge.pdf

2/2 (100.00%) Uncertainty Sampling is Preconditioned Stochastic Gradient Descent on Zero-One Loss
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  697k  100  697k    0     0   204k      0  0:00:03  0:00:03 --:--:--  204k
Download bib: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   553    0   553    0     0   1110      0 --:--:-- --:--:-- --:--:--  1108
Download supplemental: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  195k  100  195k    0     0   137k      0  0:00:01  0:00:01 --:--:--  136k
Download review: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 12371  100 12371    0     0  30246      0 --:--:-- --:--:-- --:--:-- 30246
Unzip and merge: 7927-uncertainty-sampling-is-preconditioned-stochastic-gradient-descent-on-zero-one-loss-merge.pdf
```