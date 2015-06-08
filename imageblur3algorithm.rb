class Image

      def initialize(rows)
        @pixels = rows
      end
	
	   def blur(md)
# make copy of original to modify as I scan through the original
# without changing it
      pixels_copy = @pixels.clone
    
# 1. Since there can be several combinations of numbers that, when their AVs are added together, equal
#   the MD depending on what the MD is, increment either dx or dy by 1 starting at 0 on each loop through
#   the exceptions below so that the dx and dy reset and don't keep incrementing beyond the 
#   bounds of the array. 
# 2. The dy (if you're incrementing dx) or dx (if you're incrementing dy) will
#   also change but never in a way where the two do not add up to MD
     
      
      @md = md
        @pixels.each_index do |x|
            @pixels[x].each_index do |y| 
                if @pixels[x][y] == 1
                    @dx = 0
                    @dy = @md - @dx
                    if y-@dy >= 0 and y+@dy < (@pixels[x].length - 1)
                     if x-@dx >= 0 and x+@dx < (@pixels.length - 1)

#  The intent of the while loop is to start at dx=0 or dy=0 to get the furthermost pixels, then increment dx by 1
# and decrement dy (or vice versa) to get furthermost pixels in the other direction, then increment and decrement again
# to loop through the next innermost pixels that need to be changed and so on until the other of dx and dy is zero.

# Note: this loop does not work for md=1 because what I want to do is loop through and change the pixels, increment
# and decrement as explained above and then loop through the pixel code lines again but not increment/decrement.
                          while @dx < @md
                            
                            pixels_copy[x-@dx][y] = 1
                            pixels_copy[x+@dx][y] = 1
                            pixels_copy[x][y-@dy] = 1
                            pixels_copy[x][y+@dy] = 1
                            @dx += 1
                            @dy -= 1                        
                            
                          end 
                           
                      end   
                   end
                         
                  
                    if y+@dy == (@pixels[x].length - 1) and x+@dx != (@pixels.length - 1)
# resets dx and dy so incremented dxs and dys from other 
# loops don't get carried over in this loop.
                       dx = 0
                       dy = @md - dx 
                       while dx < @md
                         pixels_copy[x+dx][y] = 1
                         pixels_copy[x-dx][y] = 1
                         pixels_copy[x][y-dy] = 1
                      
                          dx += 1
                          dy -= 1                       
                      
                      end
                    end
                    
                    if x+@dx == (@pixels.length - 1) and y+@dy != (@pixels[x].length - 1)
# resets dx and dy so incremented dxs and dys from other 
# loops don't get carried over in this loop.
                        dx = 0
                        dy = @md - dx 
                        while dx < @md
                            pixels_copy[x][y+dy] = 1
                            pixels_copy[x][y-dy] = 1 
                            dx += 1 
                            dy -= 1                        
                        end
                    end 
                end

                
            end
        end
        

      @pixels = pixels_copy
    
      
     end

    def output   
        @pixels.each do |i|
            puts i.to_s
        end
        
    end
    
end

# #x, y
# #dx, dy = x - md, x + md
# dxl = x - md
# dxr = x + md
# (dxl..dxr).each
# (dyt..dyb).each
# end
# end
# (dxl..dxr).each do |bpx|
# if bpx + bpy <= md
# (x - bpx)
# if (x - bpx) + (y - bpy)

#image = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
image = Image.new([[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]])
image.blur(1)
image.output

