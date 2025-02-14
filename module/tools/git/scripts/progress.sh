printf 'Comparing `%s`:\n' "$1"
git rev-list --left-right --count "$1" | awk '{ print "\t 🔙 behind: " $1 " commits\n\t 🔜  ahead: " $2 " commits"}'
