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
==> 535 687

1/2 (50.00%) Does Data Augmentation Lead to Positive Margin?
Download paper:
Proceedings of ICML 20 100%[==========================>] 700.19K   310KB/s  用时 2.3s
2019-12-04 04:06:18 URL:http://proceedings.mlr.press/v97/rajput19a/rajput19a.pdf [716997/716997] -> "Proceedings of ICML 2019 /Does Data Augmentation Lead to Positive Margin?/rajput19a.pdf" [1]
Download supplementary:
Proceedings of ICML 20 100%[==========================>] 777.58K   460KB/s  用时 1.7s
2019-12-04 04:06:21 URL:http://proceedings.mlr.press/v97/rajput19a/rajput19a-supp.pdf [796238/796238] -> "Proceedings of ICML 2019 /Does Data Augmentation Lead to Positive Margin?/rajput19a-supp.pdf" [1]
Merge: rajput19a-merge.pdf

2/2 (100.00%) Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin
Download paper:
Proceedings of ICML 20 100%[==========================>] 343.12K   223KB/s  用时 1.5s
2019-12-04 04:06:25 URL:http://proceedings.mlr.press/v97/wu19c/wu19c.pdf [351358/351358] -> "Proceedings of ICML 2019 /Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin/wu19c.pdf" [1]
```

```shell
┌─[murongxixi@murongxixi-xps] - [~/ML/Conference] - [三 12月 04, 04:32]
└─[$] <> paper-dl pmlr 97 margin
5 Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin (Downloaded)
4 Does Data Augmentation Lead to Positive Margin? (Downloaded)
3 Lexicographic and Depth-Sensitive Margins in Homogeneous and Non-Homogeneous Deep Models
2 Optimal Minimal Margin Maximization with Boosting
1 Fast and Flexible Inference of Joint Distributions from their Marginals
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (5)
==> 2

1/1 (100.00%) Optimal Minimal Margin Maximization with Boosting
Download paper:
Proceedings of ICML 20 100%[==========================>]   1.38M   448KB/s  用时 3.2s
2019-12-04 04:32:57 URL:http://proceedings.mlr.press/v97/mathiasen19a/mathiasen19a.pdf [1446479/1446479] -> "Proceedings of ICML 2019 /Optimal Minimal Margin Maximization with Boosting/mathiasen19a.pdf" [1]
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
==> 6

1/1 (100.00%) Constant Regret, Generalized Mixability, and Mirror Descent
Download paper:
Advances in Neural Inf 100%[==========================>] 351.82K  8.84KB/s  用时 35s
2019-12-04 03:59:50 URL:http://papers.nips.cc/paper/7971-constant-regret-generalized-mixability-and-mirror-descent.pdf [360264/360264] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/7971-constant-regret-generalized-mixability-and-mirror-descent/7971-constant-regret-generalized-mixability-and-mirror-descent.pdf" [1]
Download bib:
Advances in Neural Inf     [ <=>                       ]     509  --.-KB/s  用时 0s
2019-12-04 03:59:51 URL:http://papers.nips.cc/paper/7971-constant-regret-generalized-mixability-and-mirror-descent/bibtex [509] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/7971-constant-regret-generalized-mixability-and-mirror-descent/7971-constant-regret-generalized-mixability-and-mirror-descent.bib" [1]
Download supplemental:
Advances in Neural Inf 100%[==========================>]   2.30M  9.38KB/s  用时 4m 20s
2019-12-04 04:04:12 URL:http://papers.nips.cc/paper/7971-constant-regret-generalized-mixability-and-mirror-descent-supplemental.zip [2415916/2415916] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/7971-constant-regret-generalized-mixability-and-mirror-descent/7971-constant-regret-generalized-mixability-and-mirror-descent.zip" [1]
Download review:
Advances in Neural Inf 100%[==========================>]   7.99K  4.79KB/s  用时 1.7s
2019-12-04 04:04:14 URL:http://media.nips.cc/nipsbooks/nipspapers/paper_files/nips31/reviews/3695.html [8184/8184] -> "Advances in Neural Information Processing Systems 31 (NIPS 2018)/7971-constant-regret-generalized-mixability-and-mirror-descent/review.html" [1]
Unzip and merge: 7971-constant-regret-generalized-mixability-and-mirror-descent-merge.pdf
```
