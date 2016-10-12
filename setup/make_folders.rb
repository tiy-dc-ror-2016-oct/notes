(1..9).each do |week|
  Dir.mkdir("#{week}")
  %w(monday tuesday wedensday thursday).each_with_index do |day, i|
    Dir.mkdir("#{week}/#{i + 1} #{day}")
  end
end
