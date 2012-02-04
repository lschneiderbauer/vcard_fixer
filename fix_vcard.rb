#!/usr/bin/env ruby19

class Array
	def rotate
        	push shift
	end
end


ARGV.each do |filename|
	
	fn_exists = false
	fn = ""

	content = File.readlines(filename)

	#
	# does a FN property exist?
	# .. and just in case, grab N-data
	#
	content.each do |line|	

		if line.start_with? "FN:"
			fn_exists = true
		end

		if line.start_with? "N:"
			fn = line.strip.split(":")[1].split(";").reject{|c| c.empty?}.rotate.join(" ")
		end
	end	

	#
	# if the FN property does not exist, add it.
	#
	unless fn_exists
		content.insert(1, "FN:#{fn}\r\n")	# assume that the first line is "BEGIN:VCARD" and "FN:.." as first property
		File.write(filename, content.join)	# this may be wrong in ruby 1.8

		puts "#{filename} fixed, FN:#{fn}"
	end

end
