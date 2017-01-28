#!/usr/bin/env ruby
# coding: UTF-8

# Dotfiles - My configs, backups and scripts.
# Written in 2012 by Vladislav Mileshkin noein93@gmail.com
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

class BatchImageConverter

  def initialize(source_path, dest_path, old_format, new_format)
    @path = source_path
    @dest_path = dest_path
    @old_format = old_format
    @format = new_format
  end

  def convert
    Dir["#{@path}/*.#{@old_format}"].each do |filename|
      file = File.basename(filename)
      puts file
      %x[ convert #{@path}/#{file} #{@dest_path}/#{file.gsub(/\.[[:alnum:]]*/, ".#{@format}")} ]
    end
  end

end

if $0 == __FILE__
  BatchImageConverter.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3]).convert
end
