require "benchmark"
require "benchmark/memory"
require "benchmark/ips"

def animals1(chickens, cows, pigs)
  chickens * 2 + ((cows + pigs) * 4)
end

def animals2(chickens, cows, pigs)
  chicken_legs = chickens * 2
  cows_legs = cows * 4
  pigs_legs = pigs * 4

  chicken_legs + cows_legs + pigs_legs
end

def animals3(bipeds, *quadrupeds)
  biped_legs = bipeds * 2
  quadruped_legs = quadrupeds.sum * 4

  biped_legs + quadruped_legs
end

def animals4(bipeds, *quadrupeds)
  biped_legs = bipeds * 2
  quadruped_legs = quadrupeds.inject(&:+) * 4

  biped_legs + quadruped_legs
end

def animals5(*animals)
  biped, *quadruped = animals

  biped_legs = biped * 2
  quadruped_legs = quadruped.sum * 4

  biped_legs + quadruped_legs
end

def qoosim(chickens, cows, pigs)
  return chickens * 2 + (cows + pigs) * 4
end

def qoosim2(chickens, cows, pigs)
  chickens * 2 + (cows + pigs) * 4
end

def eduardo(*array)
  array[0] * 2 + array[1] * 4 + array[2] * 4
end

def oscar(chicken, cows, pigs)
  legs_count = 2 * chicken + 4 * (cows + pigs)
end

def santi(amount_chickens, amount_cows, amount_pigs)
  chicken_legs = 2
  cow_legs = 4
  pig_legs = 4
  (amount_chickens * chicken_legs) + (amount_cows * cow_legs) + (amount_pigs * pig_legs)
end

def benchmark(chickens, cows, pigs)
  Benchmark.bmbm do |x|
    x.report("method1") { animals1(chickens, cows, pigs) }
    # x.report("method2") { animals2(chickens, cows, pigs) }
    # x.report("method3") { animals3(chickens, cows, pigs) }
    # x.report("inject") { animals4(chickens, cows, pigs) }
    # x.report("sum") { animals5(chickens, cows, pigs) }
    x.report("qoosim return") { qoosim(chickens, cows, pigs) }
    x.report("qoosim") { qoosim2(chickens, cows, pigs) }
    x.report("eduardo") { eduardo(chickens, cows, pigs) }
    x.report("oscar") { oscar(chickens, cows, pigs) }
    x.report("santi") { santi(chickens, cows, pigs) }
  end

  Benchmark.memory do |x|
    x.report("method1") { animals1(chickens, cows, pigs) }
    # x.report("method2") { animals2(chickens, cows, pigs) }
    # x.report("method3") { animals3(chickens, cows, pigs) }
    # x.report("inject") { animals4(chickens, cows, pigs) }
    # x.report("sum") { animals5(chickens, cows, pigs) }
    x.report("qoosim return") { qoosim(chickens, cows, pigs) }
    x.report("qoosim") { qoosim2(chickens, cows, pigs) }
    x.report("eduardo") { eduardo(chickens, cows, pigs) }
    x.report("oscar") { oscar(chickens, cows, pigs) }
    x.report("santi") { santi(chickens, cows, pigs) }
    x.compare!
  end

  Benchmark.ips do |x|
    x.report("method1") { animals1(chickens, cows, pigs) }
    # x.report("method2") { animals2(chickens, cows, pigs) }
    # x.report("method3") { animals3(chickens, cows, pigs) }
    # x.report("inject") { animals4(chickens, cows, pigs) }
    # x.report("sum") { animals5(chickens, cows, pigs) }
    x.report("qoosim return") { qoosim(chickens, cows, pigs) }
    x.report("qoosim") { qoosim2(chickens, cows, pigs) }
    x.report("eduardo") { eduardo(chickens, cows, pigs) }
    x.report("oscar") { oscar(chickens, cows, pigs) }
    x.report("santi") { santi(chickens, cows, pigs) }
    x.compare!
  end
end

benchmark(2, 5, 5)
