[Git command shortcuts and other linux CLI tools](https://github.com/DanVanAtta/linux_tools/tree/master/bin)

- `git_squash 2`  Squashes the last two commits
- `git_push` Pushes the current branch
- `gbc` Prints the current branch
- `gc` alias for git checkout
- `git_commit <fileName>` searches for a filename and commits it, next prompt is for the commit message
- `gupdate` fetches the 'upstream' remote (git remote -v) and does a pull --rebase against it. Basically executes a: "rebase the current branch on top of the upstream master". For example, to update the the master branch of a fork, one could do:
  - `gc master`
  - `gupdate`
  - `git_push`
- `git_new_branch_commit <branch_name> <file(s)>` Creates a new branch, commits the files specified to that branch, then returns to the original branch. List the file name only for the commit, path for it is found searching from the current folder

Ubuntu dev environment setup
```
wget https://raw.githubusercontent.com/DanVanAtta/linux_tools/master/package_install.sh
chmod +x package_install.sh
./package_install.sh $git_username $git_email
```

Settings
- Appearance > Behavior
 - enable workspaces
 - auto-hide launcher = on
 - reveal sensitivity -> higher
- Brightness and lock
 - turn screen off > 30 minutes
- Security and Privacy
 - Files and Applications
   - record file and application usage > off
 - Search
   - include online search results > off

---------------------------------------
Prepending to Commit Messages
To prepend text to every commit message in a given range, you'd execute a message like:

git filter-branch --msg-filter 'echo "bug ###### - \c" && cat' master..HEAD

https://davidwalsh.name/update-git-commit-messages

---------------------------------------



## duplicated lines of java code
 find . -name "*.java" | xargs cat | grep -v "import" | egrep -v "^\s*[{}]\s*$" | sed '/^\s*$/d' | grep -v "@" | sort | uniq -c | sort -nr | head -200 | less



JVM flag for looking at CPU cache metrics
https://shipilev.net/jvm-anatomy-park/11-moving-gc-locality/
The cause for performance difference is very simple, and visible with -prof perfnorm (we also use -opi 1048576 to divide by number of elements):

