Currently supported websites are

- PMLR：[http://proceedings.mlr.press/](http://proceedings.mlr.press/)
- NIPS：[https://papers.nips.cc/](https://papers.nips.cc/)

## Dependencies

- curl: download tool
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
==> 97 98

1/2 (50.00%) On Symmetric Losses for Learning from Corrupted Labels
Download paper: 
Proceedings of ICML 20 100%[==========================>] 706.89K   323KB/s  用时 2.2s    
2019-12-04 03:15:15 URL:http://proceedings.mlr.press/v97/charoenphakdee19a/charoenphakdee19a.pdf [723856/723856] -> "Proceedings of ICML 2019 /On Symmetric Losses for Learning from Corrupted Labels/charoenphakdee19a.pdf" [1]
Download supplementary: 
Proceedings of ICML 20  34%[========>                  ] 174.83K  3.55KB/s  用时 66s      
Proceedings of ICML 20 100%[+++++++++=================>] 504.05K   284KB/s  用时 1.2s     
2019-12-04 03:16:24 URL:http://proceedings.mlr.press/v97/charoenphakdee19a/charoenphakdee19a-supp.pdf [516148/516148] -> "Proceedings of ICML 2019 /On Symmetric Losses for Learning from Corrupted Labels/charoenphakdee19a-supp.pdf" [2]
Merge: charoenphakdee19a-merge.pdf

2/2 (100.00%) Online learning with kernel losses
Download paper: 
Proceedings of ICML 20 100%[==========================>] 353.79K   254KB/s  用时 1.4s    
2019-12-04 03:16:28 URL:http://proceedings.mlr.press/v97/chatterji19a/chatterji19a.pdf [362285/362285] -> "Proceedings of ICML 2019 /Online learning with kernel losses/chatterji19a.pdf" [1]
Download supplementary: 
Proceedings of ICML 2019 /Online learning wit 100%[===============================================================================================>] 600.31K   367KB/s  用时 1.6s    
2019-12-04 03:16:30 URL:http://proceedings.mlr.press/v97/chatterji19a/chatterji19a-supp.pdf [614722/614722] -> "Proceedings of ICML 2019 /Online learning with kernel losses/chatterji19a-supp.pdf" [1]
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
################################################################################### 100.0%
Download bib:
################################################################################### 100.0%
Download supplemental:
################################################################################### 100.0%
Download review:
################################################################################### 100.0%
Unzip and merge: 7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity-merge.pdf

2/2 (100.00%) Constant Regret, Generalized Mixability, and Mirror Descent
Download paper:
################################################################################### 100.0%
Download bib:
################################################################################### 100.0%
Download supplemental:
################################################################################### 100.0%
Download review:
################################################################################### 100.0%
Unzip and merge: 7971-constant-regret-generalized-mixability-and-mirror-descent-merge.pdf
```
