　　该项目的脚本可以批量下载AI领域相关会议和期刊的论文，目前支持的网站有
- JMLR：[http://proceedings.mlr.press/](http://proceedings.mlr.press/)
- NIPS：[https://papers.nips.cc/](https://papers.nips.cc/)

## 依赖
　　curl

## 用法
　　脚本需放到$PATH变量中的某个路径，输入参数至少一个，jmlr.sh为卷号，nips.sh为年份，此外支持关键词查询：
```shell
┌─[murongxixi@murongxixi-xps] - [~] - [六 11月 30, 04:56]
└─[$] <> jmlr.sh 97 margin
5 Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin
4 Does Data Augmentation Lead to Positive Margin?
3 Lexicographic and Depth-Sensitive Margins in Homogeneous and Non-Homogeneous Deep Models
2 Optimal Minimal Margin Maximization with Boosting
1 Fast and Flexible Inference of Joint Distributions from their Marginals
==> papers to download (eg: 1 2 3, 1-3 or ^4), default all (5)
==> 2 4-5

1/3 (33.33%) Optimal Minimal Margin Maximization with Boosting
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 4019k  100 4019k    0     0   505k      0  0:00:07  0:00:07 --:--:--  684k
Download supplementary: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 5666k  100 5666k    0     0   972k      0  0:00:05  0:00:05 --:--:-- 1260k

2/3 (66.67%) Does Data Augmentation Lead to Positive Margin?
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  700k  100  700k    0     0   363k      0  0:00:01  0:00:01 --:--:--  363k
Download supplementary: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  777k  100  777k    0     0   367k      0  0:00:02  0:00:02 --:--:--  367k

3/3 (100.00%) Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin
Download paper: 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  343k  100  343k    0     0   221k      0  0:00:01  0:00:01 --:--:--  221k
```
关键词可以有多个：
```
┌─[murongxixi@murongxixi-xps] - [~] - [一 12月 02, 11:07]
└─[$] <> nips.sh 2018 condition gradient  
3 Uncertainty Sampling is Preconditioned Stochastic Gradient Descent on Zero-One Loss
2 Zeroth-order (Non)-Convex Stochastic Optimization via Conditional Gradient and Gradient Updates
1 Gradient Descent Meets Shift-and-Invert Preconditioning for Eigenvector Computation
==> Papers to download (eg: 1 2 3, 1-3 or ^4), default all (3)
==>
```