#!/usr/bin/env ruby
# 9-download_file.rb

require 'open-uri'
require 'uri'
require 'fileutils'

# Kontrol: 2 argüman olmalı
if ARGV.length != 2
  puts "Usage: 9-download_file.rb URL LOCALFILE_PATH"
  exit 1
end

url = ARGV[0]
local_path = ARGV[1]

begin
  uri = URI.parse(url)

  # Dosya kaydedilecek dizin yoksa oluştur
  dirname = File.dirname(local_path)
  FileUtils.mkdir_p(dirname) unless Dir.exist?(dirname)

  puts "Downloading file from #{url}…"

  # Dosyayı indir ve kaydet
  URI.open(uri) do |remote_file|
    File.open(local_path, 'wb') do |local_file|
      local_file.write(remote_file.read)
    end
  end

  puts "File downloaded and saved to #{local_path}."
rescue => e
  puts "An error occurred: #{e.message}"
end
