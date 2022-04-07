all: install extract preprocess vocab count train clean

install:
	@bash installRequirements.sh

extract:
	@bash extractShamela.sh

preprocess:
	@bash preprocessShamela.sh

vocab:
	@bash vocabShamela.sh

count:
	@bash countShamela.sh

train:
	@bash trainShamela.sh

clean:
	$(info ## Cleaning Directories & Files:)
	rm -rf shamelaCorpus*
	rm -rf shamelaCorpora/*.bin
	rm -rf *.txt *.tmp/ zips shamela
	rm -rf shamela_corpus_unproces* VCs
	@make --directory=GloVe-Arabic/ clean

delete:
	$(info ## Deleting All Directories & Files:)
	rm -rf shamelaCorpus*
	rm -rf shamelaCorpora/*.bin
	rm -rf shamelaVocab/ shamela
	rm -rf count_shamelaCorpus*.csv VCs
	@make --directory=GloVe-Arabic/ clean
	rm -rf *.zip shamelaCorp*/ *.tmp/ zips *.txt
	rm -rf allDocBooks/ allTextBooks/ allTextBooks*/
	rm -rf shamela_corpus_unprocessed* shamelaVectors/
