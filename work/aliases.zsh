alias chid="git log -n 1 | tail -n 1 | sed 's/^[ \t]*//;s/[ \t]*$//' | pbcopy"

alias superloc="cd ~/Projects/ios-i18n && gp && cd - && gsup && tools/incremental_localize.py . ../ios-i18n/App"
