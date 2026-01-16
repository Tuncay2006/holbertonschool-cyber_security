# 4-write_file.rb
require 'json'
require_relative '3-read_file'  # 3-read_file.rb'yi dahil et

def merge_json_files(file1_path, file2_path)
  # read_json_file fonksiyonunu kullan
  file1_data = read_json_file(file1_path)
  file2_data = read_json_file(file2_path)

  # Merge
  merged_data = if file1_data.is_a?(Array) && file2_data.is_a?(Array)
                  file2_data + file1_data
                elsif file1_data.is_a?(Hash) && file2_data.is_a?(Hash)
                  file2_data.merge(file1_data)
                else
                  [file2_data, file1_data].flatten
                end

  # file2.json'a yaz
  File.open(file2_path, 'w') do |f|
    f.write(JSON.pretty_generate(merged_data))
  end

  puts "Merged JSON written to #{file2_path}"
end

def count_user_ids(file_path)
  data = read_json_file(file_path)
  if data.is_a?(Array)
    data.each_with_index do |item, index|
      puts "#{index + 1}: #{item['userId']}"
    end
  else
    puts "Dosya array değil, userId sayısı alınamıyor."
  end
end
