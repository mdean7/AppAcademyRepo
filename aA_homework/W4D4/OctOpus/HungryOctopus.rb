# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

fishTank = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopus(fishTank)
  biggestFish = fishTank[0]
  (0...fishTank.length-1).each do |i|
    (i+1...fishTank.length).each do |j|
      if fishTank[i].length > fishTank[j].length && fishTank[i].length > biggestFish.length
        biggestFish = fishTank[i]
      elsif fishTank[j].length > fishTank[i].length && fishTank[j].length > biggestFish.length
        biggestFish = fishTank[j]
      end
    end
  end
  return biggestFish
end

# def dominant_octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.
  def dominant_octopus(fishTank)
    return fishTank if fishTank.length <= 1

    mid_fish = fishTank.length/2
    left_side_fish_tank = fishTank[0...mid_fish]
    right_side_fish_tank = fishTank[mid_fish..-1]

    left_tentacles = dominant_octopus(left_side_fish_tank)
    right_tentacles = dominant_octopus(right_side_fish_tank)

    sorted_fish = fish_apprasier(left_tentacles, right_tentacles)
     
  end

  def fish_apprasier(left_tentacles, right_tentacles)

    appraised_fish = []

    until left_tentacles.empty? || right_tentacles.empty?
      if left_tentacles[0].length < right_tentacles[0].length
        appraised_fish << left_tentacles.shift
      elsif left_tentacles[0].length >= right_tentacles[0].length
        appraised_fish << right_tentacles.shift
      end
    end
      appraised_fish += left_tentacles + right_tentacles
  end

  def tastiest_fish(fishTank)
   best_fish = dominant_octopus(fishTank)
    return best_fish[-1]
  end

p tastiest_fish(fishTank)

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.
def clever_octopus(fishTank)  
biggestFish = fishTank[0]
  (1...fishTank.length).each do |i|
    biggestFish = fishTank[i] if biggestFish.length < fishTank[i].length
  end
  biggestFish
end

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:
 tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

  def slow_dance("up", tiles_array)
    (0...tiles_array.length).each do |i|
      return i if "up" == tiles_array[i] 
    end
  end
# > 0

def slow_dance("right-down", tiles_array)
  (0...tiles_array.length).each do |i|
    return i if "right-down" == tiles_array[i] 
  end
end
# > 3
# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right"=> 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}
# fast_dance("up", new_tiles_data_structure)
# > 0
  def fast_dance("up", new_tiles_data_structure)
    new_tiles_data_structure["up"]
  end
  
  def fast_dance("right-down", new_tiles_data_structure)
    new_tiles_data_structure["right-down"]
  end
# > 3