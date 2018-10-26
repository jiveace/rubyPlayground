require 'prime'

prime_array = Prime.take_while { |p| p < 2_000_000 }
final_sum = prime_array.inject(&:+)
p final_sum
