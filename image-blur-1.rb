class Image
	
	def initialize(row1, *rows) 
		@image = [row1]
 		rows.each do |row|
			@image << row
		end
	end
	
#loop only for blur #1	
# #	def output_image		
# 		@image.each do |i|
# 			row = i.join
# 			puts "#{row}"
# 		end
# 	end	
	
 	def transform
#possible solution #1
		transform_array = []
		@image.map do |row|
			row[row.index(1) + 1] == 1
	    	row[row.index(1) - 1] == 1
	    transform_array << row
#figure out for top and bottom rows
	    end
	end

# #possible solution #2
# #first row
# 	@image.each do |row|
# 		if @image.index(row) = 0 
# 			row[row.index(1) + 1] == 1
# 	    	row[row.index(1) - 1] == 1
# 			below = row.index(1)
# 			row[below] == 1	# <=fix this
# #middle rows
#     	elsif
#     	if @image.index(row)    		
#      		row[row.index(1) + 1] == 1
#     		row[row.index(1) - 1] == 1
#     		above_below = row.index(1)
#     		row[above_below] == 1 		
#     	end		
# #last row
# 		else
# 			row[row.index(1) + 1] == 1
#     		row[row.index(1) - 1] == 1   			
# 	end
end
image = Image.new([0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0])
image.transform
