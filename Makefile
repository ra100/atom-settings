install:
	cat packages.list | xargs apm install

export: packages/*/
	ls packages/ > packages.list

save.js:
	cp ~/.jsbeautifyrc .jsbeautifyrc

load.js:
	cp .jsbeautifyrc ~/.jsbeautifyrc