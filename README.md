# Roadblocks in Gender Bias Measurement for Diachronic Corpora

In this repository, we contribute the scripts we wrote to process the two Arabic corpora: [Shamela Library dataset](https://shamela.ws/) and [Arabic Poem Comprehensive Dataset (APCD)](https://hci-lab.github.io/ArabicPoetry-1-Private/) that we used in our published paper [Roadblocks in Gender Bias Measurement for Diachronic Corpora](https://lin-web.clarkson.edu/~jmatthew/LChange2022/) in [the 3rd International Workshop on Computational Approaches to Historical Language Change 2022 (LChange'22)](https://languagechange.org/events/2022-acl-lchange/), ACL 2022, Dublin, Ireland.

## Shamela Scripts:

In Shamela directory, you can find all the bash scripts used to download, extract, preprocess, classify the Shamela dataset, export results and counts, and train GloVe models for each time period (before Islam/610, before 1900, after 1900). We used `Makefile` to run all bash scripts consecutively and correctly. The instructions to run/install the scripts for Shamela are described [here](https://github.com/Clarkson-Accountability-Transparency/gBiasRoadblocks/tree/main/Shamela) in detail. 

## APCD Scripts:

In APCD directory, you can find all the bash scripts used to download, extract, preprocess, classify the APCD dataset, export results and counts, and train GloVe models for each era (Pre-Islamic, Islamic, Umayyad, Mamluk, Abbasid, Ayyubid, Ottoman, Andalusian, era between Umayyad and Abbasid, Fatimid, and the modern age). We used `Makefile` to run all bash scripts consecutively and correctly. The instructions to run/install the scripts for APCD are described [here](https://github.com/Clarkson-Accountability-Transparency/gBiasRoadblocks/tree/main/APCD) in detail.

## Finally ...

If you find any of these scripts useful, please kindly cite our paper :-)

#### Citation:

> Saied Alshahrani, Esma Wali, Abdullah R Alshamsan, Yan Chen, and Jeanna Matthews. 2022. Roadblocks in Gender Bias Measurement for Diachronic Corpora. In Proceedings of the 3rd International Workshop on Computational Approaches to Historical Language Change 2022. Association for Computational Linguistics.

#### BibTeX:

TBA
