require "ruby-prof"

def vestigium(test_case, matrix_size, _rows)
  _columns = _rows.transpose
  "Case ##{test_case}: #{trace(matrix_size, _rows)} #{count(_rows)} #{count(_columns)}"
end

def trace(matrix_size, _rows)
  sum = 0
  i = 0
  while i < matrix_size
    sum += _rows[i][i]
    i += 1
  end
  sum
end

def count(rows_or_colums)
  repeated = 0
  i = 0
  while i < rows_or_colums.length
    current_row = rows_or_colums[i]
    repeated += 1 if current_row.uniq != current_row
    i += 1
  end
  repeated
end

# GC.disable

result = RubyProf.profile do
  vestigium(1, 4, [[1, 2, 3, 4], [2, 1, 4, 3], [3, 4, 1, 2], [4, 3, 2, 1]])
end

printer = RubyProf::FlatPrinter.new(result)
printer.print(File.open("vestigium_julio.txt", "w+"), min_percent: 3)

printer = RubyProf::GraphPrinter.new(result)
printer.print(File.open("vestigium_julio.txt", "w+"), min_percent: 3)

# Code to retrive input from google's editor
# test_cases = gets.to_i
# test_cases.times do |test_case|
#   test_case += 1

#   _rows = []

#   matrix_size = gets.to_i
#   matrix_size.times do |row|
#     row = gets.chomp.split(" ").map(&:to_i)
#     _rows << row
#   end

#   puts vestigium(test_case, matrix_size, _rows)
# end
