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
  
# 'instantiates' @pixels[x+1] so that its indices can be used in the y loop
# because the y loop only reads the index of pixels[x]
          @pixels[x].each_index do |y|     
              if @pixels[x][y] == 1
                if y-1 >= 0 and y != 3
                  pixels_copy[x][y-1] = 1
                  if x-1 >= 0 and x != 3
                    pixels_copy[x+1][y+1] = 1
                  end
                end
                if x-1 >= 0 and x != 3
                  pixels_copy[x-1][y] = 1
                end        
                if y == 3 and x!= 3
                 pixels_copy[x+1][y] = 1
                 pixels_copy[x-1][y] = 1
                 pixels_copy[x][y-1] = 1
                end
                if x == 3 and y != 3
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
