Currently supported websites are

- NIPS：https://papers.nips.cc/
- PMLR：http://proceedings.mlr.press/
- JMLR：http://www.jmlr.org/papers/

In the future, we will consider supporting AAAI, IJCAI, KDD, etc.

## Dependencies

- extra/wget: retrieve files from the Web
- extra/unzip: extract files in .zip archives
- extra/ghostscript: merge pdf files
- extra/recode: converts files between various character sets
- aur/[html-xml-utils](https://www.w3.org/Tools/HTML-XML-utils/): simple utilities for manipulating HTML and XML files

## Installation

```shell
git clone https://github.com/murongxixi/paper-dl.git
cd paper-dl
./install.sh  # set in paper-dl.conf, default ~/.local/bin
```

Please add ~/.local/bin to \$PATH.

## Usage

- View help and current version

```shell
paper-dl -h, --help
paper-dl -V, --version
```

- Two query manners

```shell
paper-dl -p proceeding -v volume
paper-dl -p proceeding -y year
```

Option `-p proceeding` is required at any time (except with `-h`, `-V`). Currently it must take value from {nips, pmlr, jmlr}.

Options `-v volume` and `-y year` are semi-required (except with `-h`, `-V`), i.e., one and only one of them should be given.

PMLR and JMLR can only be queried by volume number. NIPS can be queried by both, thus `paper-dl -p nips -v 1` is the same as `paper-dl -p nips -y 1988`. Note that the nips'1987 proceeding doesn't have a volume number, so it's encouraged to query by year.

- With keywords and author

```shell
paper-dl -p proceeding (-v volume | -y year) -k "keyword1 keyword2 ..."
paper-dl -p proceeding (-v volume | -y year) -a "author name"
```

These two options are mutually exclusive. If neither of them given, it will show the whole proceeding.

- Cache files

When you query some proceeding for the first time, it will take a few moment to cache the html file to speed up the subsequent queries. The cache directory can be set in paper-dl.conf.

## Examples

If neither keywords nor author given, show all the papers:

```
┌─[murongxixi@murongxixi-xps] - [~] - [三 12月 11, 16:05]
└─[$] <> paper-dl -p nips -y 2019  # -y 1987|1988|...|2019
1427 Mixtape: Breaking the Softmax Bottleneck Efficiently
    Zhilin Yang, Thang Luong, Russ R. Salakhutdinov, Quoc V. Le
    [Paper] [Bib] [Supplemental]
1426 Enabling hyperparameter optimization in sequential autoencoders for spiking neural data
    Mohammad Reza Keshtkaran, Chethan Pandarinath
    [Paper] [Bib] [Supplemental]
1425 Re-randomized Densification for One Permutation Hashing and Bin-wise Consistent Weighted Sampling
    Ping Li, Xiaoyun Li, Cun-Hui Zhang
    [Paper] [Bib] [Supplemental]
...
3 Stochastic Shared Embeddings: Data-driven Regularization of Embedding Layers
    Liwei Wu, Shuqing Li, Cho-Jui Hsieh, James L. Sharpnack
    [Paper] [Bib] [Supplemental]
2 ViLBERT: Pretraining Task-Agnostic Visiolinguistic Representations for Vision-and-Language Tasks
    Jiasen Lu, Dhruv Batra, Devi Parikh, Stefan Lee
    [Paper] [Bib] [Supplemental]
1 Multimodal Model-Agnostic Meta-Learning via Task-Aware Modulation
    Risto Vuorio, Shao-Hua Sun, Hexiang Hu, Joseph J. Lim
    [Paper] [Bib] [Supplemental]
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (1427)
==>
```

A quite tedious list, thus we encourage you to query with keywords or author.

You have multiple choosing manners for downloading papers:

- n, select the n-th paper
- m-n, select the m-th paper to n-th paper, n - m + 1 in total
- ^n, select all the papers except the n-th paper
- ^m-n, select all the papers except the m-th paper to n-th paper
- default, select all the papers except those downloaded before

```
┌─[murongxixi@murongxixi-xps] - [~] - [三 12月 11, 16:27]
└─[$] <> paper-dl -p pmlr -v 97 -k "margin"  # ICML'2019
5 Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin
    Xi-Zhu Wu, Song Liu, Zhi-Hua Zhou
    [Paper]
4 Does Data Augmentation Lead to Positive Margin?
    Shashank Rajput, Zhili Feng, Zachary Charles, Po-Ling Loh, Dimitris Papailiopoulos
    [Paper] [Supplemental]
3 Lexicographic and Depth-Sensitive Margins in Homogeneous and Non-Homogeneous Deep Models
    Mor Shpigel Nacson, Suriya Gunasekar, Jason Lee, Nathan Srebro, Daniel Soudry
    [Paper] [Supplemental]
2 Optimal Minimal Margin Maximization with Boosting
    Alexander Mathiasen, Kasper Green Larsen, Allan Grønlund
    [Paper]
1 Fast and Flexible Inference of Joint Distributions from their Marginals
    Charlie Frogner, Tomaso Poggio
    [Paper] [Supplemental]
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (5)
==> 2 4-5

1/3 (33.33%) Optimal Minimal Margin Maximization with Boosting Alexander Mathiasen, Kasper Green Larsen, Allan Grønlund
:: Download Paper
mathiasen19a.pdf       100%[==========================>]   1.38M  10.5KB/s  用时 2m 25s

2/3 (66.67%) Does Data Augmentation Lead to Positive Margin? Shashank Rajput, Zhili Feng, Zachary Charles, Po-Ling Loh, Dimitris Papailiopoulos
:: Download Paper
rajput19a.pdf          100%[==========================>] 700.19K  15.0KB/s  用时 58s
:: Download Supplemental
rajput19a-supp.pdf     100%[==========================>] 777.58K  19.0KB/s  用时 53s

3/3 (100.00%) Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin Xi-Zhu Wu, Song Liu, Zhi-Hua Zhou
:: Download Paper
wu19c.pdf              100%[==========================>] 343.12K  20.5KB/s  用时 15s
```

Besides paper, other listed files such as bib, supp, erratum etc., will also be downloaded. Supp and erratum will be automatically merged with the main paper.

Previous downloaded papers are highlighted and not selected by default:

```
┌─[murongxixi@murongxixi-xps] - [~] - [三 12月 11, 16:32]
└─[$] <> paper-dl -p pmlr -v 97 -a "zhi-hua zhou"  # query by author
2 Adaptive Regret of Convex and Smooth Functions
    Lijun Zhang, Tie-Yan Liu, Zhi-Hua Zhou
    [Paper]
1 Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin (downloaded)
    Xi-Zhu Wu, Song Liu, Zhi-Hua Zhou
    [Paper]
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (2-1=1)
==>
```

Query by multiple keywords:

```
┌─[murongxixi@murongxixi-xps] - [~] - [三 12月 11, 16:34]
└─[$] <> paper-dl -p jmlr -v 20 -k "error bound"
2 Relative Error Bound Analysis for Nuclear Norm Regularized Matrix Completion
    Lijun Zhang, Tianbao Yang, Rong Jin, Zhi-Hua Zhou
    [Paper] [Bib]
1 Scalable Kernel K-Means Clustering with Nystrom Approximation: Relative-Error Bounds
    Shusen Wang, Alex Gittens, Michael W. Mahoney
    [Paper] [Bib]
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (2)
==>
```

All the special topics and issues on [JMLR](http://www.jmlr.org/papers/) can be queried by volume, e.g.,

```
┌─[murongxixi@murongxixi-xps] - [~] - [三 12月 11, 16:35]
└─[$] <> paper-dl -p jmlr -v "Large Scale Learning"
8 Erratum: SGDQN is Less Careful than Expected
    Antoine Bordes, Léon Bottou, Patrick Gallinari, Jonathan Chang, S. Alex Smith
    [Paper]
7 Large Scale Online Learning of Image Similarity Through Ranking
    Gal Chechik, Varun Sharma, Uri Shalit, Samy Bengio
    [Paper]
6 A Streaming Parallel Decision Tree Algorithm
    Yael Ben-Haim, Elad Tom-Tov
    [Paper]
5 Hash Kernels for Structured Data
    Qinfeng Shi, James Petterson, Gideon Dror, John Langford, Alex Smola, S.V.N. Vishwanathan
    [Paper]
4 Optimized Cutting Plane Algorithm for Large-Scale Risk Minimization
    Vojtěch Franc, Sören Sonnenburg
    [Paper]
3 Hybrid MPI/OpenMP Parallel Linear Support Vector Machine Training
    Kristian Woodsend, Jacek Gondzio
    [Paper]
2 SGD-QN: Careful Quasi-Newton Stochastic Gradient Descent
    Antoine Bordes, Léon Bottou, Patrick Gallinari
    [Paper]
1 A Parameter-Free Classification Method for Large Scale Learning
    Marc Boullé
    [Paper]
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (8)
==>
```

and

```
┌─[murongxixi@murongxixi-xps] - [~] - [三 12月 11, 16:36]
└─[$] <> paper-dl -p jmlr -v "Inductive Logic Programming"
5 Learning Semantic Lexicons from a Part-of-Speech and Semantically Tagged Corpus Using Inductive Logic Programming
    Vincent Claveau, Pascale Sébillot, Cécile Fabre, Pierrette Bouillon
    [Paper]
4 Query Transformations for Improving the Efficiency of ILP Systems
    Vítor Santos Costa, Ashwin Srinivasan Rui Camacho, Hendrik Blockeel, Bart Demoen, Gerda Janssens, Jan Struyf, Henk Vandecasteele, Wim Van Laer
    [Paper]
3 Relational Learning as Search in a Critical Region
    Marco Botta, Attilio Giordana, Lorenza Saitta, Michèle Sebag
    [Paper]
2 ILP: A Short Look Back and a Longer Look Forward
    David Page, Ashwin Srinivasan
    [Paper]
1 Introduction to the Special Issue on Inductive Logic Programming
    James Cussens, Alan M. Frisch
    [Paper]
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (5)
==>
```
