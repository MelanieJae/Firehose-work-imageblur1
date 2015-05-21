class Image

      def initialize(rows)
        @pixels = rows
      end
	
	   def blur
# make copy of original to modify as I scan through the original
# without changing it
      pixels_copy = @pixels.clone
   
# abs value of change in x and y is no more than val of var distance
# 'radially' expanding square that covers more than the manhattan distance, 
#checking that positions around the original pixel don't go outside the bounds
      @pixels.each_index do |x|
          @pixels[x].each_index do |y|     
              if @pixels[x][y] == 1
                if y-1 >= 0 and y != (@pixels[x].length - 1)
                  pixels_copy[x][y-1] = 1
# allows changing of pixels on the inside without interfering with already-changed 1s
# or 0s that shouldn't be changed.
# e.g. when the first 1 is at [x][y] and the 
# second 1 is at [x+1][y+2] or possibly vice versa, second 1 is at [x-1][y+2], connection
# to manhattan distance suggestion re: absolute value of differences in x and y to trace
# the boundary of the blur? (also connection to knight's move in chess game?)
                  if x-1 >= 0 and x != (@pixels.length - 1)
                    pixels_copy[x+1][y+1] = 1
                  end
                end
                if x-1 >= 0 and x != (@pixels.length - 1)
                  pixels_copy[x-1][y] = 1
                end        
                if y == (@pixels[x].length - 1) and x!= (@pixels.length - 1)
                 pixels_copy[x+1][y] = 1
                 pixels_copy[x-1][y] = 1
                 pixels_copy[x][y-1] = 1
                end
                if x == (@pixels.length - 1) and y != (@pixels[x].length - 1)
                  pixels_copy[x][y+1] = 1
                  pixels_copy[x][y-1] = 1 
                end

              end
          end
        
      end   
      @pixels = pixels_copy
      puts @pixels
      
    end
end

image = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
image.blur
