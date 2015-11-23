help:                   ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

install:                ## installs apm packages from packages.list
	cat packages.list | xargs apm install

export: packages/*/     ## saves list of packages to packages.list
	ls packages/ > packages.list

save.js:                ## copy .jsbeautifyrc from home folder
	cp ~/.jsbeautifyrc .jsbeautifyrc

load.js:                ## copy .jsbeautifyrc to home folder
	cp .jsbeautifyrc ~/.jsbeautifyrc