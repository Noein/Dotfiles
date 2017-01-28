#!/usr/bin/env ruby

def show_help
  puts "Usage: fixname <absolute path to file or dir>"
end

def rename(path)
  dir = File.dirname path
  old = File.basename path

  new = old.strip
           .gsub(/[^[[:alnum:]]-_.]/, "_")
           .gsub(/_+/, "_")

  if old != new
    p "#{old} -> #{new}"
    print "[Y/N]> "
    answer = STDIN.gets.chomp
    if (answer =~ /y/i)
      newpath = dir + "/" + new
      puts "Renaming: #{newpath}"
      File.rename(path, newpath)
    end
  end
end

path = ARGV[0]

if File.exist?(path)
  p path
  if File.directory? path
    Dir.glob("#{path}/**/*") do |entry|
      rename entry if File.file? entry
    end
  elsif File.file? path
    rename path
  else
    show_help
  end
else
  show_help
end
