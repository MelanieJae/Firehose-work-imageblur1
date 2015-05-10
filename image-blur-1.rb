class Image

    def initialize(rows)
      @pixels = rows
    end
	
	 def transform
# make copy of original to modify as I scan through the original
# without changing it
      pixels_copy = @pixels.clone
# loop through each element of the original to scan for 1s; doing reverse 
# order of rows b/c for some reason:

#   1. pixels_copy is either still being read somehow as opposed to the original (or at the same time as @pixels) or 
#   2. @pixels is somehow being modified despite the code clearly saying to modify pixels_copy or
#   3. none of the above but sequence somehow still matters when doing modifications to pixels_copy) so only modifying pixels
#   that were already passed by in the scan of the original seems to help the most (but not completely)
 
      @pixels.each_index.reverse_each do |x|
        @pixels[x].each_index do |y|
          if @pixels[x][y] == 1
# 1st edge case exception for 1s in the corners; if there is a 1 in the corner
# it only modifies adjacent pixels on the edge of the array to 1s
            if x == 0
              if y == 0            
                pixels_copy[x+1][y] = 1
               elsif y == 3
                pixels_copy[x][y-1] = 1            
                pixels_copy[x+1][y] = 1
              end
            elsif x == 3
                if y == 0
                  pixels_copy[x-1][y] = 1
                elsif y == 3            
                  pixels_copy[x-1][y] = 1
                end
# next exception is edge cases for inner rows; if there is a 1 on the left
# or right edge of the array but in a middle row, only the three adjacent pixels
# are changed to 1s                 
            elsif y == 0
                pixels_copy[x+1][y] = 1
                pixels_copy[x-1][y] = 1
                pixels_copy[x][y+1] = 1
            elsif y == 3 
                pixels_copy[x+1][y] = 1
                pixels_copy[x][y-1] = 1             
#if no other exceptions are met (i.e. a "1" pixel is a middle x and/or y value, all four adjacent pixels are changed to 1s
# exception for y = 2 is due to the reverse order of row reading to prevent changing of[x-1][2] pixels to 1s that aren't already
# because the loop hasn't reached that adjacent pixel yet and may incorrectly change surrounding pixels to 1s. 
            elsif y == 2
              pixels_copy[x][y+1] = 1
              pixels_copy[x][y-1] = 1            
              pixels_copy[x+1][y] = 1
         
            else
              pixels_copy[x][y+1] = 1
              pixels_copy[x][y-1] = 1            
              pixels_copy[x+1][y] = 1
              pixels_copy[x-1][y] = 1  
            end
            
          end
        end
      
      end    
    @pixels = pixels_copy
    puts @pixels
    end
  
end

image = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
image.transform
