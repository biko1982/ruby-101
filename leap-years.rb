puts "Enter a year between 0 and 2100:";
start_year = gets.chomp.to_i;
puts "Enter another year, bigger than the first one:";
end_year = gets.chomp.to_i;
counter = 0;
begin_year = start_year

while begin_year <= end_year;

  if begin_year % 400 == 0 or (begin_year % 4 == 0 and begin_year % 100 != 0)
  	counter += 1
  end
  
  begin_year += 1

end

puts "There are #{counter} leap years between #{start_year} and #{end_year}."
