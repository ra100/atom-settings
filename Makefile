help:                   ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

packages-restore:              ## installs apm packages from packages.list
	./packages.sh

export: packages/*/   ## saves list of packages to packages.list
	ls packages/ > packages.list

save.js:              ## copy .jsbeautifyrc from home folder
	cp ~/.jsbeautifyrc .jsbeautifyrc

load.js:              ## copy .jsbeautifyrc to home folder
	cp .jsbeautifyrc ~/.jsbeautifyrc

backup:               ## export package list and commit and push all changes
	git commit -a -m "`date +%Y-%m-%d` before backup"
	git pull origin master
	ls packages/ > packages.list
	git add -A
	git commit -a -m "`date +%Y-%m-%d` after backup"
	git push

restore:              ## pull settings and install packages
	git stash
	git pull origin master
	packages-restore
	git stash pop