# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
    return candidate if candidate[:id]==id
  end
  nil
end

def experienced?(hash)
  hash[:years_of_experience] >= 2 ? true : false
end

def experienced_candidates(array)
new_array = Array.new
  array.each do |candidate|
      new_array << candidate if experienced?(candidate)
  end
  new_array
end

def high_github_points?(hash)
  hash[:github_points] >= 100 ? true : false  
end

def high_point_candidates(array)
  new_array = Array.new
  array.each do |candidate|
      new_array << candidate if high_github_points?(candidate)
  end
  new_array
end

def ruby_or_python?(hash)
  hash[:languages].include?("Ruby" || "Python") ? true : false 
end 

def languages_candidates(array)
  new_array = Array.new
  array.each do |candidate|
      new_array << candidate if ruby_or_python?(candidate)
  end
  new_array
end


def last_15days?(hash)
  ((Time.now.to_date) - hash[:date_applied]).to_i <=15 ? true : false  
end 

def recent_candidates(array)
  new_array = Array.new
  array.each do |candidate|
      new_array << candidate if last_15days?(candidate)
  end
  new_array
end


def old_enough?(hash)
  hash[:age] >= 18 ? true : false 
end 


def mature_candidates(array)
  new_array = Array.new
  array.each do |candidate|
      new_array << candidate if old_enough?(candidate)
  end
  new_array
end


def qualified_candidates(array)
final_list = Array.new
final_list = experienced_candidates(array)
final_list = high_point_candidates(final_list)
final_list = languages_candidates(final_list)
final_list = recent_candidates(final_list)
final_list = mature_candidates(final_list)
end
# More methods will go below

def ordered_by_qualifications(array)

loop do 
    swapped = false
  for i in 0...(array.length-1)
    if array[i][:years_of_experience] > array[i+1][:years_of_experience]
      array[i], array[i+1] = array[i+1], array[i]
      swapped = true
    end
  end
  break if not swapped
end

loop do 
    swapped = false
  for i in 0...(array.length-1)
    if array[i][:years_of_experience] == array[i+1][:years_of_experience]
      if array[i][:github_points] > array[i+1][:github_points]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
  end
  break if not swapped
end
  array.reverse

end