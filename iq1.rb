def pattern_list(card_data)
  list = []

  # horizontal
  5.times do |i|
    pattern = []
    5.times do |j|
      pattern << card_data[i * 5 + j]
    end
    list << pattern
  end

  # vertical
  5.times do |i|
    pattern = []
    5.times do |j|
      pattern << card_data[i + j * 5]
    end
    list << pattern
  end

  # cross
  pattern = []
  5.times do |i|
    pattern << card_data[i * 5 + i]
  end
  list << pattern

  pattern = []
  5.times do |i|
    pattern << card_data[i * 5 + 4 - i]
  end
  list << pattern

  list
end

pattern_a_list = pattern_list(gets.strip.split(','))
pattern_b_list = pattern_list(gets.strip.split(','))
pattern_c_list = pattern_list(gets.strip.split(','))
pattern_d_list = pattern_list(gets.strip.split(','))

min_count = 75
pattern_a_list.each do |pattern_a|
  pattern_b_list.each do |pattern_b|
    pattern_c_list.each do |pattern_c|
      pattern_d_list.each do |pattern_d|
        count = (pattern_a + pattern_b + pattern_c + pattern_d).uniq.length

        min_count = count if count < min_count
      end
    end
  end
end

puts min_count
