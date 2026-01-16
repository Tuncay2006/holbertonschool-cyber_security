require 'json'

def count_user_ids(path)
  # Dosyayı oku
  file_content = File.read(path)
  
  # JSON parse et
  data = JSON.parse(file_content)
  
  # userId'leri say
  counts = Hash.new(0)
  data.each do |item|
    user_id = item["userId"]
    counts[user_id] += 1
  end

  # Sıralı yazdır
  counts.sort.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end
