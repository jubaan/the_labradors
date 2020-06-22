require 'ruby-prof'
require_relative 'missing_letter'

array = %w(a b c d e f g h i j k l m n o p q r s t u v w x z)

RubyProf.start

# missing_letter_julio(array)
# missing_letter_oscar(array)
# missing_letter_maria(array)
missing_letter_qosim(array)

result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)

