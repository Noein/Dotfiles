require 'irb/completion'
require 'pp' # Pretty Print
IRB.conf[:AUTO_INDENT] = true

# Save History between irb sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "~/.irb_history"

# Enable colored output
require 'wirble'
Wirble.init
Wirble.colorize

alias :r :require

