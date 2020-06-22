require 'benchmark'
require 'benchmark/memory'
require 'benchmark/ips'

# --- Files to benchmark ------------------------------------------------------

require_relative 'missing_letter.rb'

def benchmark(array)
  puts
  puts '--- bmbm ---'
  puts
  Benchmark.bmbm do |x|
    x.report ('Julio') { missing_letter_julio(array) }
    x.report ('Oscar') { missing_letter_oscar(array) }
    x.report ('Maria') { missing_letter_maria(array) }
    x.report ('Qoosim') { missing_letter_qoosim(array) }
    # x.report ('Qoosim improved') { missing_letter_qoosim(array) }
  end

  puts
  puts '--- memory ---'
  puts
  Benchmark.memory do |x|
    x.report ('Julio') { missing_letter_julio(array) }
    x.report ('Oscar') { missing_letter_oscar(array) }
    x.report ('Maria') { missing_letter_maria(array) }
    x.report ('Qoosim') { missing_letter_qoosim(array) }
    x.compare!
  end

  puts
  puts '--- ips ---'
  puts
  Benchmark.ips do |x|
    x.report ('Julio') { missing_letter_julio(array) }
    x.report ('Oscar') { missing_letter_oscar(array) }
    x.report ('Maria') { missing_letter_maria(array) }
    x.report ('Qoosim') { missing_letter_qoosim(array) }
    x.compare!
  end
end

# best case escenario
# array = %w(a c)

# worst case escenario
array = %w(a b c d e f g h i j k l m o p q r s t u v w x z)

benchmark(array)
