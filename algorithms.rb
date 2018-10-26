require 'prime'
require 'humanize'
require 'date'
require 'mathn'

# Problem 1
prime_array = Prime.take_while { |p| p < 2_000_000 }
final_sum = prime_array.inject(&:+)
p final_sum

# Problem 2
p (2 ** 1000).to_s.split(//).map(&:to_i).inject(&:+)

#Problem 3
no_space_array, total = [], 0
(1..1000).to_a.map(&:humanize).each { |word| no_space_array << word.delete(" ")
  .delete("-")}.each { |element| total += element.length }
p total

#Problem 4
start_date = Time.local(1901)
end_date = Time.local(2000, 12, 31)
sunday_counter = 0

while end_date >= start_date
  if end_date.strftime("%A") == "Sunday" && end_date.strftime("%d") == "01"
    sunday_counter += 1
  end
  end_date -= 86400
end

p sunday_counter

#Problem 5
def fib
  solution, num2, i = -1, 0, 1

  while i.to_s.length < 1000
    solution +=1
    i, num2 = num2, num2 + i
  end
  solution
end

p fib

# Problem 6
p [0,1,2,3,4,5,6,7,8,9].permutation.to_a[999_999]

#Problem 7
# Really need to review this - it's quite complex
class Integer
  def dsum
    return 1 if self < 2

    pd = prime_division.flat_map{ |n, p| [n]*p }

    ([1] + (1...pd.size).flat_map{ |e| pd.combination(e).map{ |f| f.reduce(:*) }}).uniq.inject(:+)
  end
end

def find_d_sum(n)
  n.times.inject do |sum, cur|
    other = cur.dsum
    (cur != other && other.dsum == cur) ? sum + cur : sum
  end
end

p find_d_sum(10_000)


#Problem 8
p (1..100).to_a.inject(&:*).to_s.split(//).map(&:to_i).inject(&:+)

#Problem 9
class ProjectEulerTwo
  def initialize(max)
    @num_1 = 0
    @i = 0
    @sum = 0
    @num_2 = 1
    @max = max
  end

  def even_fibonacci
    while @i <= @max
      @i = @num_1 + @num_2
      @sum += @i if @i % 2 == 0

      @num_1 = @num_2
      @num_2 = @i
    end
    @sum
  end
end

pring = ProjectEulerTwo.new(4_000_000)
puts pring.even_fibonacci


#Problem 10
p (1..20).to_a.reduce(:lcm)
