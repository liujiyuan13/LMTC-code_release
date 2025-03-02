# Large-scale Multi-view Tensor Clustering with Implicit Linear Kernels

Matlab implementation for CVPR25 paper:

- Jiyuan Liu, Xinwang Liu, Chuankun Li, Xinhang Wan, Hao Tan, Yi Zhang, Weixuan Liang, Qian Qu, Yu Feng, Renxiang Guan, Ke Liang: [Large-scale Multi-view Tensor Clustering with Implicit Linear Kernels](https://liujiyuan13.github.io). IEEE/CVF Conference on Computer Vision and Pattern Recognition, CVPR, 2025.

## Introduction
**Abstract**

Multi-view clustering is a long-standing hot topic in machine learning communities, due to its capability of integrating data information from multiple sources and modalities. 
By utilizing tensor Singular Value Decomposition (t-SVD) technique with the tensor rotation trick, recent advances have achieved remarkable improvements on clustering performance. 
However, we find this is attributed to the inadvertent use of sequential information of sorted data samples, i.e. inadvertent label use, which violates the unsupervised learning setting. 
On the other hand, existing large-scale approaches are mostly developed on the basis of matrix factorization or anchor techniques, thereby fail to consider the similarities among all data samples, preventing from further performance improvement. 
To address the above issues, we first analyze the tensor rotation trick and recommend to remove it from tensor clustering. 
On its basis, a novel large-scale multi-view tensor clustering method is developed by incorporating the pair-wise similarities with implicit linear kernel function.
To solve the resultant optimization problem, we design an efficient algorithm of linear complexity.
Moreover, extensive experiments are conducted and corresponding results well support the aforementioned finding and validate the effectiveness and efficiency of the proposed method.

## Code structure

```
...
+ eval              # Matlab functions for evaluation
LICENSE             # license file
LMTC.m              # LMTC algorithm
NormalizeData.m     # data pre-processing
README.md 
run_file.m          # run file (example) of LMTC algorithm
wshrinkObj.m        # part of LMTC algorithm
```

## Citation

If you find our code useful, please cite:

    @inproceedings{liu2025lmtc,
        title     = {Large-scale Multi-view Tensor Clustering with Implicit Linear Kernels},
        author    = {Jiyuan Liu and Xinwang Liu and Chuankun Li and Xinhang Wan and Hao Tan and Yi Zhang and Weixuan Liang and Qian Qu and Yu Feng and Renxiang Guan and Ke Liang},
        year      = 2025,
        booktitle = {{IEEE/CVF} Conference on Computer Vision and Pattern Recognition, {CVPR} 2025, Music City Center, Nashville TN, June 11-15, 2025},
        publisher = {{IEEE}}
    }


## Licence

This repository is under [GPL V3](https://github.com/liujiyuan13/LMTC-code_release/blob/main/LICENSE).

## More
- For more related researches, please visit my homepage: [https://liujiyuan13.github.io](https://liujiyuan13.github.io).
- For data and discussion, please message me: liujiyuan13@nudt.edu.cn


