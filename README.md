　　该项目保存可以批量下载AI相关论文的脚本，目前支持的网站有
- [JMLR](http://proceedings.mlr.press/)
- [NIPS](https://papers.nips.cc/)

　　脚本依赖curl，每个脚本需至少一个参数，jmlr.sh的参数为卷号，nips.sh的参数为年份，此外支持关键字查询：
```shell
┌─[murongxixi@murongxixi-xps] - [~] - [四 11月 28, 18:04]
└─[$] <> nips.sh 2017 RegRet
1. 6675-improved-dynamic-regret-for-non-degenerate-functions
2. 6716-improving-regret-bounds-for-combinatorial-semi-bandits-with-probabilistically-triggered-arms-and-its-applications
3. 6718-optimistic-posterior-sampling-for-reinforcement-learning-worst-case-regret-bounds
4. 6747-regret-analysis-for-continuous-dueling-bandit
5. 6909-regret-minimization-in-mdps-with-options-without-prior-knowledge
6. 6998-efficient-sublinear-regret-algorithms-for-online-sparse-linear-regression-with-limited-observation
7. 7106-online-learning-with-transductive-regret
8. 7154-unifying-pac-and-regret-uniform-pac-bounds-for-episodic-reinforcement-learning

find 8 paper(s), download them all (Y/n): 

1/8 (12.50%)  6675-improved-dynamic-regret-for-non-degenerate-functions
download paper:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  177k  100  177k    0     0   142k      0  0:00:01  0:00:01 --:--:--  142k
download bib:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   543    0   543    0     0   1050      0 --:--:-- --:--:-- --:--:--  1048
download supplemental:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  110k  100  110k    0     0   106k      0  0:00:01  0:00:01 --:--:--  106k
download review:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5655  100  5655    0     0  13826      0 --:--:-- --:--:-- --:--:-- 13826

2/8 (25.00%)  6716-improving-regret-bounds-for-combinatorial-semi-bandits-with-probabilistically-triggered-arms-and-its-applications
download paper:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  341k  100  341k    0     0   210k      0  0:00:01  0:00:01 --:--:--  210k
download bib:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   615    0   615    0     0   1169      0 --:--:-- --:--:-- --:--:--  1169
```