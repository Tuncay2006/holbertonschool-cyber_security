# 3-read_file.rb
require 'json'

def read_json_file(file_path)
  if File.exist?(file_path)
    JSON.parse(File.read(file_path))
  else
    [] # Dosya yoksa boş array döndür
  end
end
