Ubuntu dev environment setup:
- https://github.com/DanVanAtta/linux_tools/tree/master/install
- https://github.com/DanVanAtta/linux_tools/tree/master/config


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
