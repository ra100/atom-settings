#!/bin/bash

ls packages/ > packages.old
diff packages.old packages.list > packages.diff
sed -rn 's/^>\ ((\w[-]?)*)$/\1/p' < packages.diff > packages.new
sed -rn 's/^<\ ((\w[-]?)*)$/\1/p' < packages.diff > packages.remove
cat packages.remove | xargs apm remove
cat packages.new | xargs apm install
rm packages.diff packages.new packages.remove packages.old