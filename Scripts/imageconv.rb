#!/usr/bin/env ruby
# coding: UTF-8

# Dotfiles - My configs, backups and scripts.
# Written in 2012 by Vladislav Mileshkin noein93@gmail.com
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

class BatchImageConverter

  def initialize(folder_path, new_format)
    @path = folder_path
    @format = new_format
  end

  def convert
    filenames.each_line do |filename|
      filename.chop!
      %x[ convert #{@path+filename} #{@path+filename[/[a-z0-9]*/i] + ".#{@format}"} ]
      remove(@path + filename)
    end
  end

private
  def filenames
    %x[ ls -1 #{@path} ]
  end

  def remove(filename)
    %x[ rm #{filename} ]
  end

end

if $0 == __FILE__
  BatchImageConverter.new(ARGV[0], ARGV[1]).convert
end
