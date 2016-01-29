help:                   ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

packages-restore:              ## installs apm packages from packages.list
	./packages.sh

export-packages: packages/*/   ## saves list of packages to packages.list
	ls packages/ > packages.list

backup:               ## export package list and commit and push all changes
	git checkout master
	git commit -a -m "`uname -n` before backup"
	git checkout (uname -n)
	ls packages/ > packages.list
	git add packages.list
	git commit packages.list -m "`uname -n` packages"
	git add -A
	git commit -a -m "other settings"
	git push

restore:              ## pull settings and install packages
	git stash
	git pull origin master
	packages-restore
	git stash pop