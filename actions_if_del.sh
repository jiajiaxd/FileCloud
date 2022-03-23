result=$(echo `git log -n 1 --summary`  != `git log --diff-filter=D -n 1  --summary`)
if [ -n "$result" ]; then
	git diff-tree -r --no-commit-id --name-only `git rev-parse HEAD` | xargs -t -i{} cp --parents {} changes/
fi
result=$(echo `git log -n 1 --summary` | grep delete)
if [ -n "$result" ]; then
	git log --diff-filter=D -n 1  --summary | grep 'delete' | tee changes/deletions.txt
	cp changes/deletions.txt changes/AutoDeleteForWindows.bat
	sed -i "s/ delete mode 100644 //g" changes/deletions.txt
	sed -i "s/ delete mode 100644 /del .minecraft\//g" changes/AutoDeleteForWindows.bat
else
	echo "The latest commit has no deletions."
fi
