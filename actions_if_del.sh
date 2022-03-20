result=$(echo `git log -n 1 --summary` | grep delete)
if [ -n "$result" ]; then
	git log --diff-filter=D -n 1  --summary | grep 'delete' | tee changes/deletions.txt
else
	echo "::warning The latest commit has no deletions."
fi