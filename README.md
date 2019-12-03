This repository provides the shell script for downloading ai conference proceedings. Currently supported websites are

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

When you download some proceeding for the first time, it will take some time to cache the .html file. Please be patient.

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
==> 67 97-98

1/3 (33.33%) A Kernel Perspective for Regularizing Deep Neural Networks
Download paper:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  347k  100  347k    0     0  24443      0  0:00:14  0:00:14 --:--:-- 12320
Download supplementary:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  683k  100  683k    0     0  32212      0  0:00:21  0:00:21 --:--:-- 30509
Merge: bietti19a-merge.pdf

2/3 (66.67%) On Symmetric Losses for Learning from Corrupted Labels
Download paper:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  706k  100  706k    0     0  67821      0  0:00:10  0:00:10 --:--:-- 44780
Download supplementary:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  504k  100  504k    0     0  22630      0  0:00:22  0:00:22 --:--:-- 19225
Merge: charoenphakdee19a-merge.pdf

3/3 (100.00%) Online learning with kernel losses
Download paper:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  353k  100  353k    0     0   134k      0  0:00:02  0:00:02 --:--:--  134k
Download supplementary:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  600k  100  600k    0     0   301k      0  0:00:01  0:00:01 --:--:--  301k
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
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  768k  100  768k    0     0   310k      0  0:00:02  0:00:02 --:--:--  310k
Download bib:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   533    0   533    0     0    851      0 --:--:-- --:--:-- --:--:--   850
Download supplemental:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  455k  100  455k    0     0   193k      0  0:00:02  0:00:02 --:--:--  193k
Download review:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 17961  100 17961    0     0  22423      0 --:--:-- --:--:-- --:--:-- 22395
Unzip and merge: 7934-efficient-online-algorithms-for-fast-rate-regret-bounds-under-sparsity-merge.pdf

2/2 (100.00%) Constant Regret, Generalized Mixability, and Mirror Descent
Download paper:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  351k  100  351k    0     0   227k      0  0:00:01  0:00:01 --:--:--  227k
Download bib:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   509    0   509    0     0    889      0 --:--:-- --:--:-- --:--:--   889
Download supplemental:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 2359k  100 2359k    0     0   443k      0  0:00:05  0:00:05 --:--:--  538k
Download review:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  8184  100  8184    0     0  17229      0 --:--:-- --:--:-- --:--:-- 17229
Unzip and merge: 7971-constant-regret-generalized-mixability-and-mirror-descent-merge.pdf
```
