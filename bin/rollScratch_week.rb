#!/usr/bin/env ruby
require 'fileutils'

#Move the current scratch file into Archived Folders
baseDirectory = ARGV[0]

if(baseDirectory == nil)
  puts "Must pass in Scratch directory"
  exit -1
end

date = Time.now
dateSuffix = date.strftime("%Y_%m_%d")
year = date.year

originalFilePrefix = "Scratch"
originalFile = "#{baseDirectory}/#{originalFilePrefix}.txt"
yearDirectory = "#{baseDirectory}/#{year}"
fileName = "#{originalFilePrefix}_#{dateSuffix}.txt"

if File.zero? originalFile
  puts "Scratch is empty. We're done"
  exit 0
end

if !File.exist? yearDirectory
  FileUtils.mkdir yearDirectory
end

if File.exist? "#{yearDirectory}/#{fileName}"
  puts "Archive file aready exists"
  exit -1
end
  
FileUtils.copy("#{originalFile}", "#{yearDirectory}/#{fileName}")
FileUtils.remove "#{originalFile}"
   
if !File.exist?("#{originalFile}")
  FileUtils.touch "#{originalFile}"
end
