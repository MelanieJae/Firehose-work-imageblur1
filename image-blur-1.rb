class Image
	
	def initialize(row1,*rows) 
		@image = Array[row1,row2,row3,row4]
 			@row1 = row2
 			@rows.each do |row|
 				@row = row
			end
		@image = 
	#use @image = rows with *rows and that's all you need.
	end
	
#loop only for blur #1	
# #	def output_image		
# 		@image.each do |i|
# 			row = i.join
# 			puts "#{row}"
# 		end
# 	end	
	
 		def blur
    		@image.each do |row|   		
     			row[row.index(1) + 1] == 1
    			row[row.index(1) - 1] == 1 				
    		end		
    	end		

image = Image.new([0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0])
image.blur
end