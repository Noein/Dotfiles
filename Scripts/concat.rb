#!/usr/bin/env ruby
# coding: UTF-8

# Dotfiles - My configs, backups and scripts.
# Written in 2012 by Vladislav Mileshkin noein93@gmail.com
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

module Concatenable

  def concat
    get_strings.join(@delimiter)
  end

private
  def get_strings
    strings = []
    while not @input.eof?
      strings << @input.gets.to_s.chomp
    end
    strings
  end

end

class StringFileConcatenator

  include Concatenable

  def initialize(delimiter, filename)
    @delimiter = delimiter
    @input = File.open(filename, 'r')
  end

end

class StringStdinConcatenator

  include Concatenable

  def initialize(delimiter)
    @delimiter = delimiter
    @input = STDIN
  end

end

if ARGV[1]
  puts StringFileConcatenator.new(ARGV[0], ARGV[1]).concat
else
  puts StringStdinConcatenator.new(ARGV[0] || " ").concat
end
