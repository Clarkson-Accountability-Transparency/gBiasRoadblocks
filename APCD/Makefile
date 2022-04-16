all: install extract preprocess vocab count train clean

install:
	@bash installRequirements.sh

extract:
	@bash extractAPCD.sh

preprocess:
	@bash preprocessAPCD.sh

vocab:
	@bash vocabAPCD.sh

count:
	@bash countAPCD.sh

train:
	@bash trainAPCD.sh

clean:
	$(info ## Cleaning Directories & Files:)
	rm -rf ages VCs APCD.csv
	rm -rf vocabAPCD/vocab_count
	rm -rf Poems/*.bin *.txt *.tmp
 	@make --directory=GloVe-Arabic/ clean

delete:
	$(info ## Deleting All Directories & Files:)
	rm -rf vocabAPCD/vocab_count
	rm -rf Poems/ ages VCs APCD.csv
	rm -rf Poems/*.bin *.txt *.tmp *.zip
	@make --directory=GloVe-Arabic/ clean
	rm -rf vocabAPCD/ vectorsAPCD/ countAPCD/
