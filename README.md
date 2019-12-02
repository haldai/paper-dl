　　该项目的脚本可以批量下载AI领域相关会议和期刊的论文，目前支持的网站有
- JMLR：[http://proceedings.mlr.press/](http://proceedings.mlr.press/)
- NIPS：[https://papers.nips.cc/](https://papers.nips.cc/)

## 依赖
　　curl

## 用法
　　脚本(包括util.sh)需放到$PATH变量中的某个路径，输入参数至少一个，jmlr.sh为卷号，nips.sh为年份：
```shell
┌─[murongxixi@murongxixi-xps] - [~] - [六 11月 30, 04:56]
└─[$] <> jmlr.sh 97
773 Natural Analysts in Adaptive Data Analysis
772 Fast Context Adaptation via Meta-Learning
771 Beating Stochastic and Adversarial Semi-bandits Optimally and Simultaneously
770 Latent Normalizing Flows for Discrete Sequences
769 Surrogate Losses for Online Learning of Stepsizes in Stochastic Non-Convex Optimization
……
5 Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin
4 Does Data Augmentation Lead to Positive Margin?
3 Lexicographic and Depth-Sensitive Margins in Homogeneous and Non-Homogeneous Deep Models
2 Optimal Minimal Margin Maximization with Boosting
1 Fast and Flexible Inference of Joint Distributions from their Marginals
==> papers to download (eg: 1 2 3, 1-3 or ^4), default all (773)
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
==> Papers to download (eg: 1 2 3, 1-3 or ^4), default all (3)
==>
```