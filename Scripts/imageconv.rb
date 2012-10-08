# coding: UTF-8

# Dotfiles - My configs, backups and scripts.
# Written in 2012 by Vladislav Mileshkin noein93@gmail.com
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

path = ARGV[0]
str = %x[ ls -1 #{path} ]

str.each_line do |pic|
  pic.chop!
  %x[ convert #{path+pic} #{path+pic[/[a-z0-9]*/i] + ".jpg"} ]
  %x[ rm #{path+pic} ]
end
