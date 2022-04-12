# Roadblocks in Gender Bias Measurement for Diachronic Corpora

In this repository, we contribute the scripts we wrote to process [Shamela Library dataset](https://shamela.ws/) and [Arabic Poem Comprehensive Dataset (APCD)](https://hci-lab.github.io/ArabicPoetry-1-Private/) corpora that we used in our published paper ([Roadblocks in Gender Bias Measurement for Diachronic Corpora](https://lin-web.clarkson.edu/~jmatthew/LChange2022/)) in [the 3rd International Workshop on Computational Approaches to Historical Language Change 2022 (LChange'22)](https://languagechange.org/events/2022-acl-lchange/), ACL 2022, Dublin, Ireland.

## Shamela Scripts:

In Shamela directory, you can find all the bash scripts used to download, extract, preprocess, categorize the Shamela dataset, export results and counts, and train GloVe models for each time period (before Islam/610, before 1900, after 1900). We used `Makefile` to run all bash scripts consecutively and correctly. The instructions to run/install the scripts for Shamela are described in [here](https://github.com/Clarkson-Accountability-Transparency/gBiasRoadblocks/tree/main/Shamela). 

## APCD Scripts:

In APCD directory, you can find all the bash scripts used to download, extract, preprocess, categorize the APCD dataset, export results and counts, and train GloVe models for each era (Pre-Islamic, Islamic, Umayyad, Mamluk, Abbasid, Ayyubid, Ottoman, Andalusian, era between Umayyad and Abbasid, Fatimid, and the modern age). We used `Makefile` to run all bash scripts consecutively and correctly. The instructions to run/install the scripts for APCD are described in [here](https://github.com/Clarkson-Accountability-Transparency/gBiasRoadblocks/tree/main/APCD).
