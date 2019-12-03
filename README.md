Currently supported websites are

- PMLR：[http://proceedings.mlr.press/](http://proceedings.mlr.press/)
- NIPS：[https://papers.nips.cc/](https://papers.nips.cc/)

## Dependencies

- wget: download tool
- unzip: extract supplementary
- perl: non-greedy matching for regular expression
- ghostscript: merge pdf files

## Installation

```shell
git clone https://github.com/murongxixi/paper-dl.git
cd paper-dl
sudo ./install.sh
```

## Usage

```shell
paper-dl pmlr/nips volume/year [keyword1 keyword2 ...]
```

The first two args are necessary, keywords list is optional.

When you download some proceeding for the first time, it will take some time to cache the .html file.

## Examples

```shell
┌─[murongxixi@murongxixi-xps] - [~] - [二 12月 03, 11:37]
└─[$] <> paper-dl pmlr 97
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
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (773)
==> 98

1/1 (100.00%) Online learning with kernel losses
Download paper: 
Proceedings of ICML 20 100%[==========================>] 353.79K   265KB/s  用时 1.3s    
2019-12-04 03:28:29 URL:http://proceedings.mlr.press/v97/chatterji19a/chatterji19a.pdf [362285/362285] -> "Proceedings of ICML 2019 /Online learning with kernel losses/chatterji19a.pdf" [1]
Download supplementary: 
Proceedings of ICML 20 100%[==========================>] 600.31K   356KB/s  用时 1.7s    
2019-12-04 03:28:31 URL:http://proceedings.mlr.press/v97/chatterji19a/chatterji19a-supp.pdf [614722/614722] -> "Proceedings of ICML 2019 /Online learning with kernel losses/chatterji19a-supp.pdf" [1]
Merge: chatterji19a-merge.pdf
```

```shell
┌─[murongxixi@murongxixi-xps] - [~/ML/Conference] - [二 12月 03, 17:39]
└─[$] <> paper-dl nips 2018 regret
9 Regret Bounds for Online Portfolio Selection with a Cardinality Constraint
8 Regret bounds for meta Bayesian optimization with an unknown Gaussian process prior
7 Efficient Online Portfolio with Logarithmic Regret
6 Constant Regret, Generalized Mixability, and Mirror Descent
5 Efficient online algorithms for fast-rate regret bounds under sparsity
4 Policy Regret in Repeated Games
3 A no-regret generalization of hierarchical softmax to extreme multi-label classification
2 Regret Bounds for Robust Adaptive Control of the Linear Quadratic Regulator
1 Acceleration through Optimistic No-Regret Dynamics
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (9)
==> 5-6

1/2 (50.00%) Efficient online algorithms for fast-rate regret bounds under sparsity
Download paper: 
Advances in Neural Inf 100%[==========================>] 768.58K  8.02KB/s  用时 1m 40s  
2019-12-04 03:31:06 URL:http://papers.nips.cc/paper/7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity.pdf [787029/787029] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/Efficient online algorithms for fast-rate regret bounds under sparsity/7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity.pdf" [1]
Download bib: 
Advances in Neural Inf     [ <=>                       ]     533  --.-KB/s  用时 0s      
2019-12-04 03:31:08 URL:http://papers.nips.cc/paper/7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity/bibtex [533] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/Efficient online algorithms for fast-rate regret bounds under sparsity/7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity.bib" [1]
Download supplemental: 
Advances in Neural Inf 100%[==========================>] 455.67K  6.45KB/s  用时 60s     
2019-12-04 03:32:08 URL:http://papers.nips.cc/paper/7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity-supplemental.zip [466611/466611] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/Efficient online algorithms for fast-rate regret bounds under sparsity/7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity.zip" [1]
Download review: 
Advances in Neural Inf 100%[==========================>]  17.54K  41.9KB/s  用时 0.4s    
2019-12-04 03:32:09 URL:http://media.nips.cc/nipsbooks/nipspapers/paper_files/nips31/reviews/3496.html [17961/17961] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/Efficient online algorithms for fast-rate regret bounds under sparsity/review.html" [1]
Unzip and merge: 7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity-merge.pdf

2/2 (100.00%) Constant Regret, Generalized Mixability, and Mirror Descent
Download paper: 
Advances in Neural Inf 100%[==========================>] 351.82K  11.0KB/s  用时 45s     
2019-12-04 03:32:57 URL:http://papers.nips.cc/paper/7971-constant-regret-generalized-mixability-and-mirror-descent.pdf [360264/360264] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/Constant Regret, Generalized Mixability, and Mirror Descent/7971-constant-regret-generalized-mixability-and-mirror-descent.pdf" [1]
Download bib: 
Advances in Neural Inf     [ <=>                       ]     509  --.-KB/s  用时 0s      
2019-12-04 03:32:59 URL:http://papers.nips.cc/paper/7971-constant-regret-generalized-mixability-and-mirror-descent/bibtex [509] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/Constant Regret, Generalized Mixability, and Mirror Descent/7971-constant-regret-generalized-mixability-and-mirror-descent.bib" [1]
Download supplemental: 
Advances in Neural Inf 100%[==========================>]   2.30M  4.28KB/s  用时 4m 28s  
2019-12-04 03:37:28 URL:http://papers.nips.cc/paper/7971-constant-regret-generalized-mixability-and-mirror-descent-supplemental.zip [2415916/2415916] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/Constant Regret, Generalized Mixability, and Mirror Descent/7971-constant-regret-generalized-mixability-and-mirror-descent.zip" [1]
Download review: 
Advances in Neural Inf 100%[==========================>]   7.99K  --.-KB/s  用时 0s      
2019-12-04 03:37:29 URL:http://media.nips.cc/nipsbooks/nipspapers/paper_files/nips31/reviews/3695.html [8184/8184] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/Constant Regret, Generalized Mixability, and Mirror Descent/review.html" [1]
Unzip and merge: 7971-constant-regret-generalized-mixability-and-mirror-descent-merge.pdf
```
