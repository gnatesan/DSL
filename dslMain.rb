class DSL

	def mainMenu
		# presents the main menu until the user quits
		# allows the user to process orders
		end=false
		while(!end)
		puts "<<<< Main Menu >>>>"
		puts "1. Load Rules"
		puts "2. Process Orders"
		puts "3. End"
		puts "Your selection: "
		selection = gets.chomp
		if selection == "1"
			optionFile
		else if selection == "2"
			processOrder
		else
			end=true
		end
	end

	def optionFile
		puts "Enter filename containing rules: "
		file=gets.chomp
		# add a .txt extension if not there
		if !file.include?".txt"
			file=file+".txt"
		end
		#File.open()
		#throw exception if error thrown
	end

	def processOrder
		puts "Enter product type or 'D' (done) to end: "
		prod=gets.chomp
		#process product

		rescue ArgumentError
			# argument is incorrect
		end
	end

end