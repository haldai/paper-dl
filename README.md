Currently supported websites are

- NIPS：https://papers.nips.cc/
- PMLR：http://proceedings.mlr.press/
- JMLR：http://www.jmlr.org/papers/

In the future, we will consider supporting AAAI, IJCAI, KDD, etc.

## Dependencies

- wget: download tool
- unzip: extract supplementary
- ghostscript: merge pdf files

## Installation

```shell
git clone https://github.com/murongxixi/paper-dl.git
cd paper-dl
sudo ./install.sh  # /usr/local/bin/
```

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

Option `-p proceeding` is required at any time (except with `-h` or `-V`). Currently it must take value from {nips, pmlr, jmlr}.

Options `-v volume` and `-y year` are semi-required (except with `-h`, `-V`, `-c`), i.e., one and only one of them should be given.

PMLR and JMLR can only be queried by volume. NIPS can be queried by both, thus `paper-dl -p nips -v 1` is the same as `paper-dl -p nips -y 1988`. Note that the nips'1987 proceeding doesn't have a volume number, so it's encouraged to query by year.

- With keywords and author

```shell
paper-dl -p proceeding (-v volume | -y year) -k "keyword1 keyword2 ..."
paper-dl -p proceeding (-v volume | -y year) -a "author name"
```

These two options are mutually exclusive. If neither of them is given, it will show the whole proceeding.

- Delete out-of-date or corrupt cache files

When you query some proceeding for the first time, it will take a few moment to cache the html files to speed up the subsequent queries. If these files are out-of-date due to the update on server or corrupted when downlod being interrupted, you can delete them by `-c` option:

```shell
paper-dl -p proceeding [-v volume | -y year] -c
```

If volume and year are both not given, it will delete the index.html, e.g., http://proceedings.mlr.press/index.html, otherwise the corresponding proceeding page will be removed, e.g., http://proceedings.mlr.press/v97/.

## Examples

If neither keywords nor author given, show all the papers:

```
└─[$] <> paper-dl -p nips -y 2018  # -y 1987|1988|...|2019
1009 GroupReduce: Block-Wise Low-Rank Approximation for Neural Language Model Shrinking
    Patrick Chen, Si Si, Yang Li, Ciprian Chelba, Cho-Jui Hsieh
1008 The Price of Fair PCA: One Extra dimension
    Samira Samadi, Uthaipon Tantipongpipat, Jamie H. Morgenstern, Mohit Singh, Santosh Vempala
1007 Transfer of Deep Reactive Policies for MDP Planning
    Aniket (Nick) Bajpai, Sankalp Garg, Mausam
……
3 Kalman Normalization: Normalizing Internal Representations Across Network Layers
    Guangrun Wang, jiefeng peng, Ping Luo, Xinjiang Wang, Liang Lin
2 Structure-Aware Convolutional Neural Networks
    Jianlong Chang, Jie Gu, Lingfeng Wang, GAOFENG MENG, SHIMING XIANG, Chunhong Pan
1 Efficient Algorithms for Non-convex Isotonic Regression through Submodular Optimization
    Francis Bach
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (1009)
==>
```

You have multiple choosing manners

- n, select the n-th paper
- m-n, select the m-th paper to n-th paper, n - m + 1 in total
- ^n, select all the papers except the n-th paper
- ^m-n, select all the papers except the m-th paper to n-th paper
- default, select all the papers except downloaded before

```
└─[$] <> paper-dl -p pmlr -v 97 -k "margin"  # ICML'2019
5 Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin
    Xi-Zhu Wu, Song Liu, Zhi-Hua Zhou
4 Does Data Augmentation Lead to Positive Margin?
    Shashank Rajput, Zhili Feng, Zachary Charles, Po-Ling Loh, Dimitris Papailiopoulos
3 Lexicographic and Depth-Sensitive Margins in Homogeneous and Non-Homogeneous Deep Models
    Mor Shpigel Nacson, Suriya Gunasekar, Jason Lee, Nathan Srebro, Daniel Soudry
2 Optimal Minimal Margin Maximization with Boosting
    Alexander Mathiasen, Kasper Green Larsen, Allan Grønlund
1 Fast and Flexible Inference of Joint Distributions from their Marginals
    Charlie Frogner, Tomaso Poggio
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (5)  # ^ is the not operator, i.e., ^a means not choosing a
==> 2 4-5

1/3 (33.33%) Optimal Minimal Margin Maximization with Boosting Alexander Mathiasen, Kasper Green Larsen, Allan Grønlund
:: Download paper
mathiasen19a.pdf        23%[=====>                     ] 333.36K  2.98KB/s  用时 2m 59s
mathiasen19a.pdf        35%[++++++==>                  ] 497.03K  3.35KB/s  用时 67s
mathiasen19a.pdf       100%[+++++++++=================>]   1.38M  4.08KB/s  用时 4m 5s

2/3 (66.67%) Does Data Augmentation Lead to Positive Margin? Shashank Rajput, Zhili Feng, Zachary Charles, Po-Ling Loh, Dimitris Papailiopoulos
:: Download paper
rajput19a.pdf            5%[>                          ]  38.55K  --.-KB/s  用时 16m 3s
rajput19a.pdf          100%[+=========================>] 700.19K  3.60KB/s  用时 1m 52s
:: Download supplementary
rajput19a-supp.pdf      31%[=======>                   ] 242.97K  3.56KB/s  用时 1m 45s
rajput19a-supp.pdf     100%[++++++++==================>] 777.58K  5.22KB/s  用时 91s

3/3 (100.00%) Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin Xi-Zhu Wu, Song Liu, Zhi-Hua Zhou
:: Download paper
wu19c.pdf               58%[==============>            ] 199.86K  2.19KB/s  用时 81s
wu19c.pdf               83%[+++++++++++++++======>     ] 287.05K  --.-KB/s  用时 16m 18s
wu19c.pdf              100%[++++++++++++++++++++++====>] 343.12K  1.01KB/s  用时 48s
```

When the connection is broken, wget can resume the download.

Previous downloaded papers are highlighted:

```
└─[$] <> paper-dl -p pmlr -v 97 -a "zhi-hua zhou"  # query by author
2 Adaptive Regret of Convex and Smooth Functions
    Lijun Zhang, Tie-Yan Liu, Zhi-Hua Zhou
1 Heterogeneous Model Reuse via Optimizing Multiparty Multiclass Margin (Downloaded)
    Xi-Zhu Wu, Song Liu, Zhi-Hua Zhou
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (2-1=1)
==>
```

Query by multiple keywords:

```
└─[$] <> paper-dl -p jmlr -v 20 -k "error bound"
2 Relative Error Bound Analysis for Nuclear Norm Regularized Matrix Completion (Downloaded)
    Lijun Zhang, Tianbao Yang, Rong Jin, Zhi-Hua Zhou
1 Scalable Kernel K-Means Clustering with Nystrom Approximation: Relative-Error Bounds
    Shusen Wang, Alex Gittens, Michael W. Mahoney
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (2-1=1)
==>
```

All the special topics and issues on [JMLR](http://www.jmlr.org/papers/) can be queried by volume, e.g.,

```
└─[$] <> paper-dl -p jmlr -v "Large Scale Learning"
8 Erratum: SGDQN is Less Careful than Expected (Downloaded)
    Antoine Bordes, Léon Bottou, Patrick Gallinari, Jonathan Chang, S. Alex Smith
7 Large Scale Online Learning of Image Similarity Through Ranking
    Gal Chechik, Varun Sharma, Uri Shalit, Samy Bengio
6 A Streaming Parallel Decision Tree Algorithm
    Yael Ben-Haim, Elad Tom-Tov
5 Hash Kernels for Structured Data (Downloaded)
    Qinfeng Shi, James Petterson, Gideon Dror, John Langford, Alex Smola, S.V.N. Vishwanathan
4 Optimized Cutting Plane Algorithm for Large-Scale Risk Minimization (Downloaded)
    Vojtěch Franc, Sören Sonnenburg
3 Hybrid MPI/OpenMP Parallel Linear Support Vector Machine Training (Downloaded)
    Kristian Woodsend, Jacek Gondzio
2 SGD-QN: Careful Quasi-Newton Stochastic Gradient Descent (Downloaded)
    Antoine Bordes, Léon Bottou, Patrick Gallinari
1 A Parameter-Free Classification Method for Large Scale Learning
    Marc Boullé
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (8-5=3)
==>
```

and

```
└─[$] <> paper-dl -p jmlr -v "Inductive Logic Programming"
5 Learning Semantic Lexicons from a Part-of-Speech and Semantically Tagged Corpus Using Inductive Logic Programming
    Vincent Claveau, Pascale Sébillot, Cécile Fabre, Pierrette Bouillon
4 Query Transformations for Improving the Efficiency of ILP Systems
    Vítor Santos Costa, Ashwin Srinivasan Rui Camacho, Hendrik Blockeel, Bart Demoen, Gerda Janssens, Jan Struyf, Henk Vandecasteele, Wim Van Laer
3 Relational Learning as Search in a Critical Region
    Marco Botta, Attilio Giordana, Lorenza Saitta, Michèle Sebag
2 ILP: A Short Look Back and a Longer Look Forward
    David Page, Ashwin Srinivasan
1 Introduction to the Special Issue on Inductive Logic Programming
    James Cussens, Alan M. Frisch
==> Papers to download (eg: 1 2 3, 1-3 or ^3), default all (5)
==>
```
