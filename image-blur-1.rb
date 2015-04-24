class Image
	attr_accessor :row1, :row2, :row3, :row4
	
	def initialize(row1,row2,row3,row4)
		@image = Array[row1,row2,row3,row4]
			self.row1 = row1
			self.row2 = row2
			self.row3 = row3
			self.row4 = row4
	end
	
	def output_image		
		@image.each do |i|
#			puts i.to_s
			row = i.join
			puts "#{row}"
		end
	end	
	
end
image = Image.new([0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0])
image.output_image
