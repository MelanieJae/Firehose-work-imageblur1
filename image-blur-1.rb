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
                (md+1).times do |a| 
                  if y+a <= (@pixels[x].length - 1) and y-a >= 0
                    if x-a >= 0 and x+a <= (@pixels.length - 1)  
                  
                      puts a   
                    
                      pixels_copy[x-a][y] = 1
                      pixels_copy[x][y-a] = 1
                      pixels_copy[x-a][y-a] = 1
                      # pixels_copy[x+a][y+a] = 1
                      pixels_copy[x-md][y-md] = 0
                      pixels_copy[x-a][y] = 1
                      pixels_copy[x][y+a] = 1
                      
                    end
                  end
                end
                # (1..2).times do |a| 
                #   if y+a <= (@pixels[x].length - 1) and y-a >= 0
                #     if x-a >= 0 and x+a <= (@pixels.length - 1)  
                  
                #     puts a   
                #     pixels_copy[x+md][y] = 1
                #     pixels_copy[x-a][y-a] = 1
                      
                #     pixels_copy[x+a][y+a] = 1
                #     pixels_copy[x+2][y-a] = 0
                #     end
                #   end 
                # end  
                      # pixels_copy[x-a][y+a] = 1
                      # pixels_copy[x+a][y-a] = 1
                      # pixels_copy[x+a][y+a] = 1
                          
                      # dxa = x - a
                      # dxb = x + a
                      # dyl = y - a
                      # dyr = y + a
                         
                      #      if (dxb + dyr) > md
                      #        pixels_copy[x+a][y+a] = 0
                      #      end

                          # if (dxb + dyl) > md 
                          #   pixels_copy[x+a][y-a] = 0
                          # end
                        
                          # if (dxa + dyr) > md
                          #   pixels_copy[x-a][y+a] = 0
                          # end
                          
                          # if (dxa + dyl) > md
                          #   pixels_copy[x-a][y-a] = 0
                          # end
                      
                   
                    
                  
                
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

