result=$(echo `git log -n 1 --summary` | grep delete)
if [ -n "$result" ]; then
	git log --diff-filter=D -n 1  --summary | grep 'delete' | tee changes/deletions.txt
	cp changes/deletions.txt changes/AutoPatchWindows.bat
	sed -i "s/delete mode 100644 //g" changes/deletions.txt
	sed -i "s/delete mode 100644 /del .minecraft\//g" changes/AutoPatchWindows.bat
else
	echo "The latest commit has no deletions."
fi
