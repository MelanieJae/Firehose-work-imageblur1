class Image

   	def initialize(row1,*rows)
      @image = []
      @row1 = row1
      @image << @row1
      @rows = rows
      @image << @rows
      
#    puts @image
   	end


#loop only for blur #1	
# #	def output_image		
# 		@image.each do |i|
# 			row = i.join
# 			puts "#{row}"
# 		end
# 	end	
	
	def scan
#    @row1.each_index {|x| puts x}
#    @rows.each {|x| puts x}

    @row1.each do |x|
      @idx = []
      if x == 1
        puts @row1.index(x)
        @idx << @row1.index(x)
      else
        @idx << -1
      end 
    end

#    @rows.each do |x|
      @array = []
      @array << @rows[0].to_a
      puts @array
      puts @array.include?(1)
#      puts @array.index(1)
#      end
#      @array.each do |y|
#        if y == 1
#          puts @array.index(y)
#        end   
#        puts @rows.index(1)
#       @temprow = []
#       @temprow << x
#       @temprow.each do |y|
#         if y == 1
#           puts @temprow.index(y)
# #         @idx << @rows.index(x)
#         else
#           puts -1
# #         @idx << -1
#         end
# #      puts @idx
#      end
 	  
  end
 	# def transform
	 # 	new_image = @image.dup 
  # 		puts new_image
  # 		x = 1
 	# 	new_image[x+1] = 1
 	#     new_image[x-1] = 1
 	#     # new_image[x][y+1] = 1
 	#     # new_image[x][y-1] = 1
 	#     puts new_image
  #   end
#	puts @idx	
#	puts new_image
#	@image = new_image
#	end

end
image = Image.new([0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0])
image.scan
#image.transform
