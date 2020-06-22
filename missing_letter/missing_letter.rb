def missing_letter_julio(array)
  index = 0
  while index < array.length
    missing_letter = array[index].succ!
    next_letter = array[index + 1]
    return missing_letter unless missing_letter == next_letter
    index += 1
  end
end

def missing_letter_oscar(array)
  length = array.size
  return -1 if array.nil? || length < 2
  length.times do |index|
    break if array[index + 1].nil?
    first = array[index]
    second = array[index + 1]
    return (second.ord - 1).chr if second.ord - first.ord > 1
  end
end

def missing_letter_maria(array)
  upper = array[0].match(/\p{Upper}/)
  array.map { |letter| letter.downcase }
  alphabet_chunk = *(array[0].. array[-1])
  result = (alphabet_chunk - array)[0]
  upper ? result.upcase : result
end

def missing_letter_qosim(array)
  start = array[0]
  rear = array[-1]
  all_array = start.upto(rear).to_a
  missing_letter = all_array - array
  return missing_letter
end
