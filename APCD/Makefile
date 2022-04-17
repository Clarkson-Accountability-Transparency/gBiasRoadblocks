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
	rm -rf ages VCs poemsACPD/*.bin
	@make --directory=GloVe-Arabic/ clean
	rm -rf vocabsAPCD/vocab_count *.txt *.tmp


delete:
	$(info ## Deleting All Directories & Files:)
	rm -rf vocabsAPCD/vocab_count
	rm -rf poemsACPD/ ages VCs APCD.csv
	@make --directory=GloVe-Arabic/ clean
	rm -rf poemsACPD/*.bin *.txt *.tmp *.zip
	rm -rf vocabsAPCD/ vectorsAPCD/ countsAPCD/
