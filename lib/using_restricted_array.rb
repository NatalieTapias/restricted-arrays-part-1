require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) where n is the length of the array argument
# Space complexity: O(1) constant
def length(array)
  length = 0
  until array[length] == nil
    length +=1
  end
  return length
  raise NotImplementedError
end

# Prints each integer values in the array
# Time complexity: ? O(n) where n is the length of the array argument
# Space complexity: ? O(1) constant
def print_array(array)
  length(array).times do |i|
    puts array[i]
  end
  raise NotImplementedError
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ? O(n) where n is the length of the array argument
# Space complexity: ? O(1) constant
def search(array, length, value_to_find)
  if length == 0
    return false
  end
  i = 0
  while i < length
    if value_to_find == array[i]
      return true
    end
    i += 1
  end
  return false 
  
  raise NotImplementedError
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: ? O(n), depends on the length of the array
# Space complexity: ? O(1), constant
def find_largest(array, length)
  largest = 0
  length.times do |i|
    if array[i] > largest
      largest = array [i]
    end
  end
  return largest
  raise NotImplementedError
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: ? O(n), depnds on the length of the array
# Space complexity: ? O(1), constant
def find_smallest(array, length)
  smallest = array[0]
  length.times do |i|
    if array[i] < smallest
      smallest = array[i]
    end
  end
  return smallest
  raise NotImplementedError
end

# Reverses the values in the integer array in place
# Time complexity: ? O(n/2) * it decreases the number of indices you have to go through in half. I believe this evaluates to O(n) where n is the length
# Space complexity: ?  O(1) constant since you're reassigning the array indices in place
def reverse(array, length)
  
  if length <= 1
    return array
  end
  i = 0
  j = length - 1
  
  while i < j
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    i += 1
    j -= 1
  end
  
  return array
  raise NotImplementedError
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ? O(log n) - binary search
# Space complexity: ? O(1) it is constant
def binary_search(array, length, value_to_find)
  if length == 0
    return false
  end
  low = 0
  high = length - 1
  while low <= high 
    mid = (low + high) / 2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    else array[mid] < value_to_find
      low = mid + 1
    end
  end
  return false
  
  raise NotImplementedError
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
