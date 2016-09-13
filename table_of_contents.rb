line_width = 40
title = "Table of contents"
chapters = {"Chapter 1: Numbers" => "page 1", "Chapter 2: Letters" => "page 72", "Chapter 3: Variables" => "page 118"}
puts title.center line_width
chapters.length.times do
  |i|
  puts chapters.keys[i].ljust(line_width / 2) + chapters.values[i].rjust(line_width / 2)
end

chapters["Chapter 4: Methods"] = "page 168"

puts title.center line_width
chapters.length.times do
  |i|
  puts chapters.keys[i].ljust(line_width / 2) + chapters.values[i].rjust(line_width / 2)
end
