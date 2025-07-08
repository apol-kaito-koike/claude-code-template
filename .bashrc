 # カレントディレクトリがGitリポジトリであれば、ブランチ名を表示するように変更
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]:\[\e[31m\]$(branch=$(git branch --show-current 2>/dev/null); [ -n "$branch" ] && echo "($branch)\[\e[0m\]:")\[\e[0m\]\$'
