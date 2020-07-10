# Gems to install
#  benchmark-ips
#  benchmark-memory

#  Ruby class = Benchmark

# require "benchmark"
# require "benchmark/memory"
# require "benchmark/ips"

def method_while
  index = 0
  while index <= 10
    index
    index += 1
  end
end

method_while

# def method_each
#   (0..10).each do |num|
#     num
#   end
# end

# # method_each

# def benchmark
#   puts "> --- time ------"
#   Benchmark.bmbm do |x|
#     x.report("while") { method_while }
#     x.report("each") { method_each }
#   end

#   puts "> --- memory ------"
#   Benchmark.memory do |x|
#     x.report("while") { method_while }
#     x.report("each") { method_each }
#     x.compare!
#   end

#   puts "> --- memory ------"
#   Benchmark.ips do |x|
#     x.report("while") { method_while }
#     x.report("each") { method_each }
#     x.compare!
#   end
# end

# benchmark
