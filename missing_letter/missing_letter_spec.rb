# require_relative 'maria'
require_relative 'oscar'
require_relative 'qosim'
require_relative 'julio'

RSpec.describe "#missing_letter" do
  it 'returns the missing letter in the sequence' do
    array = ["a", "b", "c", "e", "f", "g"]
    expected = 'd'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["O", "Q", "R", "S"]
    expected = 'P'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["t", "u", "v", "w", "x", "z"]
    expected = 'y'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["m", "o"]
    expected = 'n'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    expected = 'i'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["q", "s", "t"]
    expected = 'r'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["c", "d", "e", "f", "g", "h", "i", "k", "l", "m", "n"]
    expected = 'j'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["e", "f", "g", "h", "i", "j", "k", "m", "n", "o", "p"]
    expected = 'l'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["t", "u", "w", "x"]
    expected = 'v'
    expect(missing_letter(array)).to eq(expected)
  end

  it 'returns the missing letter in the sequence' do
    array = ["B", "D"]
    expected = 'C'
    expect(missing_letter(array)).to eq(expected)
  end
end

