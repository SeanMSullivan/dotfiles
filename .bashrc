# automatically create completion-aware g<alias> bash aliases for each of your git aliases.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi


function_exists() {
	declare -f -F $1 > /dev/null
	return $?
}

for al in $(git config --get-regexp '^alias\.' | cut -f 1 -d ' ' | cut -f 2 -d '.'); do

  alias g${al}="git ${al}"

  complete_func=_git_$(__git_aliased_command ${al})
  function_exists ${complete_fnc} && __git_complete g${al} ${complete_func}
done
unset al
