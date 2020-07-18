require "benchmark"
require "benchmark/memory"
require "benchmark/ips"

# --- Maria --------------------------------------------------------------------
def vestigium_maria(test_case, size, matrix)
  col_count = 0
  row_count = 0
  trace = 0
  size.times do |idx|
    col_check = []
    size.times do |jdx|
      trace += matrix[jdx][idx] if jdx == idx
      col_check << matrix[jdx][idx]
    end
    col_count += 1 unless col_check.uniq.size == size
    row_count += 1 unless matrix[idx].uniq.size == size
  end
  "Case ##{test_case}: #{trace} #{row_count} #{col_count}"
end

################################################################################

# --- Julio --------------------------------------------------------------------
def vestigium_julio(test_case, matrix_size, _rows)
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

################################################################################

def benchmark(test_case, matrix_size, _rows)
  puts
  puts "> --- Elapsed time ----------------------------------------------------"
  puts
  Benchmark.bmbm do |x|
    x.report("Maria") { vestigium_maria(test_case, matrix_size, _rows) }
    x.report("Julio") { vestigium_julio(test_case, matrix_size, _rows) }
  end

  puts
  puts "> --- Memory ----------------------------------------------------------"
  puts
  Benchmark.memory do |x|
    x.report("Maria") { vestigium_maria(test_case, matrix_size, _rows) }
    x.report("Julio") { vestigium_julio(test_case, matrix_size, _rows) }
    x.compare!
  end

  puts
  puts "> --- IPS -------------------------------------------------------------"
  puts
  Benchmark.ips do |x|
    x.report("Maria") { vestigium_maria(test_case, matrix_size, _rows) }
    x.report("Julio") { vestigium_julio(test_case, matrix_size, _rows) }
    x.compare!
  end
end

benchmark(1, 4, [[1, 2, 3, 4], [2, 1, 4, 3], [3, 4, 1, 2], [4, 3, 2, 1]])
