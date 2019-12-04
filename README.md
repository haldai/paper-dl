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
paper-dl proceeding volume [keyword1 keyword2 ...]
```

The first two args are necessary. `proceeding` can be `pmlr` or `nips`. `volume` can be found in their websites. Keywords list is optional.

When you download some proceeding for the first time, it will take some time to cache the .html file.

## Examples

If no keywords input, show all the papers:

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

Highlight the downloaded papers before:

```shell
└─[$] <> paper-dl pmlr 97 margin
5 Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin (Downloaded)
4 Does Data Augmentation Lead to Positive Margin? (Downloaded)
3 Lexicographic and Depth-Sensitive Margins in Homogeneous and Non-Homogeneous Deep Models
2 Optimal Minimal Margin Maximization with Boosting
1 Fast and Flexible Inference of Joint Distributions from their Marginals
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (3)
==> 2

1/1 (100.00%) Optimal Minimal Margin Maximization with Boosting
Download paper:
Proceedings of ICML 20 100%[==========================>]   1.38M   448KB/s  用时 3.2s
2019-12-04 04:32:57 URL:http://proceedings.mlr.press/v97/mathiasen19a/mathiasen19a.pdf [1446479/1446479] -> "Proceedings of ICML 2019 /Optimal Minimal Margin Maximization with Boosting/mathiasen19a.pdf" [1]
```

Multiple choosing manners:

```shell
└─[$] <> paper-dl nips 31 regret
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
==> 5-6 2

1/3 (33.33%) Regret Bounds for Robust Adaptive Control of the Linear Quadratic Regulator
Download paper:
Advances in Neural Inf 100%[==========================>] 937.70K   644KB/s  用时 1.5s
Download bib:
Advances in Neural Inf     [ <=>                       ]     584  --.-KB/s  用时 0s
Download supplemental:
Advances in Neural Inf 100%[==========================>]   1.62M   686KB/s  用时 2.4s
Download review:
Advances in Neural Inf 100%[==========================>]  11.55K  --.-KB/s  用时 0.001s
Unzip and merge: 7673-regret-bounds-for-robust-adaptive-control-of-the-linear-quadratic-regulator-merge.pdf

2/3 (66.67%) Efficient online algorithms for fast-rate regret bounds under sparsity
Download paper:
Advances in Neural Inf 100%[==========================>] 768.58K   465KB/s  用时 1.7s
Download bib:
Advances in Neural Inf     [ <=>                       ]     533  --.-KB/s  用时 0s
Download supplemental:
Advances in Neural Inf 100%[==========================>] 455.67K   375KB/s  用时 1.2s
Download review:
Advances in Neural Inf 100%[==========================>]  17.54K  87.5KB/s  用时 0.2s
Unzip and merge: 7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity-merge.pdf

3/3 (100.00%) Constant Regret, Generalized Mixability, and Mirror Descent
Download paper:
Advances in Neural Inf 100%[==========================>] 351.82K   336KB/s  用时 1.0s
Download bib:
Advances in Neural Inf     [ <=>                       ]     509  --.-KB/s  用时 0s
Download supplemental:
Advances in Neural Inf 100%[==========================>]   2.30M   608KB/s  用时 3.9s
Download review:
Advances in Neural Inf 100%[==========================>]   7.99K  --.-KB/s  用时 0s
Unzip and merge: 7971-constant-regret-generalized-mixability-and-mirror-descent-merge.pdf
```

Multiple keywords are splitted by spaces and repeated download is avoided automatically:

```shell
└─[$] <> paper-dl nips 31 mirror descent
2 Constant Regret, Generalized Mixability, and Mirror Descent (Downloaded)
1 Stochastic Composite Mirror Descent: Optimal Bounds with High Probabilities
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (1)
==>

1/1 (100.00%) Stochastic Composite Mirror Descent: Optimal Bounds with High Probabilities
Download paper:
Advances in Neural Inf 100%[==========================>] 433.50K   413KB/s  用时 1.1s
Download bib:
Advances in Neural Inf     [ <=>                       ]     524  --.-KB/s  用时 0s
Download supplemental:
Advances in Neural Inf 100%[==========================>] 386.76K   381KB/s  用时 1.0s
Download review:
Advances in Neural Inf 100%[==========================>]   8.53K  --.-KB/s  用时 0s
Unzip and merge: 7425-stochastic-composite-mirror-descent-optimal-bounds-with-high-probabilities-merge.pdf
```
