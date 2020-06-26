require 'benchmark'
require 'benchmark/memory'
require 'benchmark/ips'

def partition_maria(array)
  return array if array.size < 2
  pivot = array[0]
  small = array.clone.select{|x| x < pivot}
  small = partition_maria(small.clone)
  big = array.clone.select{|x| x > pivot}
  big = partition_maria(big.clone)
  (small + [pivot] + big).join(' ')
  small + [pivot] + big unless (small + [pivot] + big).size == @size
end

def simple_quicksort_maria(array)
  @size = array.size
  partition_maria(array)
end

def partition_qoosim(array)
  return array if array.length <= 1
  pivot = array.first
  array.delete_at(array.index(pivot))
  lesser, greater = [], []
  for item in array
    item <= pivot ? lesser << (item): greater << (item)
  end
  (partition_qoosim(lesser) + [pivot] + partition_qoosim(greater)).join(' ')
  lesser + [pivot] + greater unless (lesser + [pivot] + greater).size == @size
end

def simple_quicksort_qoosim(array)
  @size = array.size
  partition_qoosim(array)
end

def quick_sort(array)
  #recursion break condition
  if array.length <= 1
    return array
  end
  pivot = array[0]
  # pivot delete
  array.shift()
  left_array = []
  right_array = []
  array.each do |i|
    #sort
    i < pivot ? left_array << (i) : right_array << (i)
  end
  left_sort = quick_sort(left_array)
  right_sort = quick_sort(right_array)
  left_sort + [pivot] + right_sort
end

def quicksort(array)
  return array if array.length <= 1
  pivot = array.first
  array.delete_at(array.index(pivot))
  lesser, greater = [], []
  for item in array
    item <= pivot ? lesser << (item): greater << (item)
  end
  quicksort(lesser) + [pivot] + quicksort(greater)
end

def benchmark(array)
  puts '> --- Time ---------------------------'
  Benchmark.bmbm do |x|
    x.report ('Maria') { simple_quicksort_maria(array) }
    x.report ('Qoosim') { simple_quicksort_qoosim(array) }
    x.report ('Qoosim') { quicksort(array) }
    x.report ('Eduardo') { quick_sort(array) }
  end
  puts '> --- Memory ------------------------'
  Benchmark.memory do |x|
    x.report ('Maria') { simple_quicksort_maria(array) }
    x.report ('Qoosim') { simple_quicksort_qoosim(array) }
    x.report ('Qoosim') { quicksort(array) }
    x.report ('Eduardo') { quick_sort(array) }
    x.compare!
  end
  puts '> --- IPS ---------------------------'
  Benchmark.ips do |x|
    x.report ('Maria') { simple_quicksort_maria(array) }
    x.report ('Qoosim') { simple_quicksort_qoosim(array) }
    x.report ('Qoosim') { quicksort(array) }
    x.report ('Eduardo') { quick_sort(array) }
    x.compare!
  end
end

array = Array.new(100_000) { rand(0..100_000) }
benchmark(array)
