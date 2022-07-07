# Shamela Scripts:

We used these bash scripts to download, extract, preprocess, classify the Shamela dataset, export results and counts, and train GloVe models for each time period (before Islam/610, before 1900, and after 1900). We used `Makefile` to run all bash scripts consecutively and correctly.  To run/install these scripts flawlessly, please follow the instructions below, and if you faced any difficulties, feel free to report an issue.

## Installing Requirements:

#### 1. System Requirements (Command-line Utilities):

These bash scripts use several Unix/Linux command-line utilities like `tr` (for translating or deleting characters), `sed` (for filtering and transforming text), `iconv` (for converting between encoding schemes), and `awk` (for pattern scanning and language processing), [CAMeL](https://camel-tools.readthedocs.io/en/latest/index.html) command-line tools to dediacritize the Arabic diacritical marks and remove unnecessary characters, and other necessary command-line utilities. The list of the system requirements can be found in [requirements.system](https://github.com/Clarkson-Accountability-Transparency/gBiasRoadblocks/blob/main/Shamela/requirements.system "requirements.system"). These system requirements are only compatible with Unix/Linux/macOS systems.

#### 2. Python Requirements:

The basic Python requirements are using python3 and installing a few used packages/models using `pip3`.  The list of the Python requirements can be found in [requirements.pip](https://github.com/Clarkson-Accountability-Transparency/gBiasRoadblocks/blob/main/Shamela/requirements.pip "requirements.pip"). 

#### # Requirements' Installation:

- **Auto Installation**: 
  
  The `Makefile` will automatically install all the system and python requirements and bash scripts, but running the installation commands first seems wise. To do so, you can use the `make install` command or run the bash script directly.
  
  ```bash
  sudo bash installRequirements.sh
  ```

- **Manual Installation**:
  
  If you prefer installing command-line utilities and python packages manually, use these commands based on your operation system.
  
  1. <u>Unix/Linux</u>:
     
     ```bash
     cat requirements.system | xargs sudo apt -qq install -y
     sudo apt -qq install python3-pip -y
     yes | pip3 install -r requirements.pip --quiet
     ```
  
  2. <u>macOS (using Homebrew)</u>:
     
     ```bash
     cat requirements.system | xargs brew install
     yes | pip3 install -r requirements.pip --quiet
     ```

## Running All Scripts:

You can run all the bash scripts using the `Makefile` command: `make`. We recommend you to run it inside a `screen` or `tmux` session because the execution will take a while. The `make` command will cleanup the unnecessary directories and files by the end of the execution. To run `Makefile` commands separately or run bash scripts and commands directly, you need to follow the following order of executing the commands.

#### 1. Installing Requirements:

```bash
make install # OR #
sudo bash installRequirements.sh
```

#### 2. Downloading/Extracting Shamela:

```bash
make extract # OR #
sudo bash extractShamela.sh
```

#### 3. Preprocessing Shamela:

```bash
make preprocess # OR #
sudo bash preprocessShamela.sh
```

#### 4. Building Vocabulary:

```bash
make vocab # OR #
sudo bash vocabShamela.sh
```

#### 5. Counting Words and Frequencies:

```bash
make count # OR #
sudo bash countShamela.sh
```

#### 6. Training GloVe Models:

```bash
make train # OR #
sudo bash trainShamela.sh
```

#### 7. Cleaning Unnecessary Directories & Files:

```bash
make clean 
# OR #
rm -rf shamelaCorpus*
rm -rf shamelaCorpora/*.bin
rm -rf *.txt *.tmp/ zips shamela
rm -rf shamela_corpus_unproces* VCs
@make --directory=GloVe-Arabic/ clean
```

#### 8. Deleting All Directories & Files:

```bash
make delete 
# OR #
rm -rf shamelaCorpus*
rm -rf shamelaCorpora/*.bin
rm -rf shamelaVocab/ shamela
rm -rf count_shamelaCorpus*.csv VCs
@make --directory=GloVe-Arabic/ clean
rm -rf *.zip shamelaCorp*/ *.tmp/ zips *.txt
rm -rf allDocBooks/ allTextBooks/ allTextBooks*/
rm -rf shamela_corpus_unprocessed* shamelaVectors/
```
