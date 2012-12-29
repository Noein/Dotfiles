#!/usr/bin/env ruby
# coding: UTF-8

# Dotfiles - My configs, backups and scripts.
# Written in 2012 by Vladislav Mileshkin noein93@gmail.com
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

class StringConcatenator

  def initialize(delimiter, filename = nil)
    @delimiter = delimiter
    if filename
      @input = File.open(filename, 'r')
    else
      @input = STDIN
    end
  end

  def get_strings
    strings = []
    while not @input.eof?
      strings << @input.gets.to_s.chomp
    end
    strings
  end

  def concat
    get_strings.join(@delimiter)
  end

end

if ARGV[1]
  puts StringConcatenator.new(ARGV[0], ARGV[1]).concat
else
  puts StringConcatenator.new(ARGV[0] || " ").concat
end
