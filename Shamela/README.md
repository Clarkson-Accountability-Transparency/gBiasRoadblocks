# Shamela Scripts:

We used these bash scripts to download, extract, preprocess, classify the Shamela dataset, export results and counts, and train GloVe models for each time period (before Islam/610, before 1900, after 1900). We used `Makefile` to run all bash scripts consecutively and correctly.  To run/install these scripts flawlessly, please follow the instructions below, and if you faced any difficulties, feel free to report an issue.

## Installing Requirements:

#### 1. System Requirements (Command-line Utilities):

These bash scripts use several Unix/Linux command-line utilities like `tr` (for translating or deleting characters), `sed` (for filtering and transforming text), `iconv` (for converting between encoding schemes), and `awk` (for pattern scanning and language processing), [CAMeL](https://camel-tools.readthedocs.io/en/latest/index.html) command-line tools to dediacritize the Arabic diacritical marks and remove unnecessary characters, and other necessary command-line utilities. The list of the system requirements can be found in [requirements.system](https://github.com/Clarkson-Accountability-Transparency/gBiasRoadblocks/blob/main/Shamela/requirements.system "requirements.system"). These system requirements are only compatible with Unix/Linux/macOS systems.

#### 2. Python Requirements:

The basic Python requirements are using python3 and installing a few used packages/models using `pip3`.  The list of the Python requirements can be found in [requirements.pip](https://github.com/Clarkson-Accountability-Transparency/gBiasRoadblocks/blob/main/Shamela/requirements.system "requirements.pip"). 

#### Requirements' Installation:

- Auto Installation: 
  
  The `Makefile` will automatically install all the system and python requirements and bash scripts, but running the installation commands first seems wise. To do so, you can use the `make` command or run the bash script directly.
  
  ```bash
  make install
  # OR
  sudo bash installRequirements.sh
  ```

- Manual Installation:
  
  If you prefer installing command-line utilities and python packages manually, use these commands based on your operation system.
  
  1. Unix/Linux:
     
     ```bash
     cat requirements.system | xargs sudo apt -qq install -y
     sudo apt -qq install python3-pip -y
     yes | pip3 install -r requirements.pip --quiet
     ```
  
  2. macOS (using Homebrew):
     
     ```bash
     cat requirements.system | xargs brew install
     yes | pip3 install -r requirements.pip --quiet
     ```
