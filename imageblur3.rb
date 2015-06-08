class Image

      def initialize(rows)
        @pixels = rows
      end
	
	   def blur(md)
# make copy of original to modify as I scan through the original
# without changing it
      
      pixels_copy = @pixels.clone 
      
        @pixels.each_index do |x|
          @pixels[x].each_index do |y| 
              if @pixels[x][y] == 1
        #exceptions to ensure all changed pixels are within bounds of array in the x-dir and y-dir                  
                

                  if y+md < (@pixels[x].length - 1) and y-md >= 0
                    if x-md >= 0 and x+md < (@pixels.length - 1)  
                      (md+1).times do |a|
          #puts statement keeps track of loop to let me know when 
          # the loop isn't working right
          #expected output: 0,1,2 only once for md = 2
                        puts a   
                    
                        pixels_copy[x-a][y+a] = 1
                        pixels_copy[x][y+a] = 1
                        pixels_copy[x+a][y+a] = 1
                        pixels_copy[x+a][y] = 1
                        pixels_copy[x-a][y] = 1
                        pixels_copy[x+a][y-a] = 1
                        pixels_copy[x][y-a] = 1
                        pixels_copy[x-a][y-a] = 1
         #exception to change pixels that are beyond MD from original pixel
         #a > md takes care of any pixels where the x or y diff from original
         # is more than one, e.g.  dx=dy=1 is the greatest allowed for md =2 
         #a=md takes care of odd pixels like 0,0 where the sum dx + dy is beyond 2 but
         # the abs values of the differences is still below 2 so normal formulas
         # for creating the diagonal won't work.          
                        if a >= md
                          pixels_copy[x-a][y-a] = 0
                          pixels_copy[x-a][y+a] = 0
                          pixels_copy[x+a][y+a] = 0
                          pixels_copy[x+a][y-a] = 0
                        end

                      end

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



#assigned array
#image = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
#larger test array for greater mds
image = Image.new([[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]])
image.blur(2)
image.output
