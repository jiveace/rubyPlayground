a = [1, 5, 1, 2, 10, 100, 3, 1]
b = [1, 5, 1, 2, 10, 100, 3, 1]
c = [1, 5, 1, 2, 10, 100, 3, 1]

def bubble_sort(arr)
  n = arr.length

  loop do
    swapped = false
    (n-1).times do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end

    break if not swapped
  end

  arr
end

def quick_sort(arr)
  return [] if arr.empty?

  pivot = arr.delete_at(rand(arr.size))
  left, right = arr.partition(&pivot.method(:>))

  return *quick_sort(left), pivot, *quick_sort(right)
end

def merge_sort(arr)
  if arr.length <=1
    arr
  else
    mid = (arr.length / 2).floor
    left = merge_sort(arr[0..mid - 1])
    right = merge_sort(arr[mid..arr.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

p "Quick:" + quick_sort(a).to_s
p "Bubble:" +  bubble_sort(b).to_s
p "Merge:" +  merge_sort(c).to_s
