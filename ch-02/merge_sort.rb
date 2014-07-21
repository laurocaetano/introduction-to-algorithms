K = 13

def insertion_sort(array)
  for j in 1..array.size - 1
    key = array[j]
    i = j - 1

    while (i >= 0 && array[i] > key)
      array[i + 1] = array[i]
      i = i -1;
    end

    array[i + 1] = key
  end

  array
end

def merge_sort(array)
  array_size = array.size

  return array if array_size == 1
  return insertion_sort(array) if array_size <= K

  start = array_size / 2
  final = array_size - start

  left = array.slice(0, start)
  right = array.slice(start, final)

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  size = left.size + right.size
  i = 0
  j = 0
  array = []

  for k in 0..size do
    if i < left.size && j < right.size
      if left[i] <= right[j]
        array[k] = left[i]
        i = i + 1
      else
        array[k] = right[j]
        j = j + 1
      end
    elsif i < left.size
      array[k] = left[i]
      i = i + 1
    elsif j < right.size
      array[k] = right[j]
      j = j + 1
    end
  end

  array
end

unsorted_array = (1..50).collect { rand(50) }

sorted_array = merge_sort(unsorted_array)
