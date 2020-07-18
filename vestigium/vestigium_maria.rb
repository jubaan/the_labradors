require "ruby-prof"

def vestigium_maria(test_case, size, matrix)
  col_check = []
  col_count = 0
  row_count = 0
  trace = 0
  size.times do |idx|
    col_check = []
    size.times do |jdx|
      trace += matrix[jdx][idx] if jdx == idx
      col_check << [matrix[jdx][idx]]
    end
    col_count += 1 unless col_check.uniq.size == size
    row_count += 1 unless matrix[idx].uniq.size == size
  end
  "Case ##{test_case}: #{trace} #{row_count} #{col_count}"
end

result = RubyProf.profile do
  vestigium_maria(1, 4, [[1, 2, 3, 4], [2, 1, 4, 3], [3, 4, 1, 2], [4, 3, 2, 1]])
end

printer = RubyProf::FlatPrinter.new(result)
printer.print(File.open("vestigium_maria.txt", "w+"), min_percent: 3)

printer = RubyProf::GraphPrinter.new(result)
printer.print(File.open("vestigium_maria.txt", "w+"), min_percent: 3)
