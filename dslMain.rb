class Product

	attr_accessor:type
	attr_accessor:actions

	def initialize(type)
		arr = ["book", "membership", "ski pass", "video", "boots", "helmet"]
		if arr.include?type
			@type = type
			@actions = []
		else
			#throw an error because the type is not a valid product
			raise NameError, "#{type} is not a valid product name"
		end
	end

	# add an action to the product to be called
	def add_action(action)
		@actions << action
	end

	def product(p)
		puts "------- Processing order for a #{p}"
	end

	def packing_slip(slip)
		puts "------- Printing packing slip for #{slip}"

	end

	def activate
		puts "------- Activating membership"
	end

	def pay(action)
		puts "------- Paying #{action}"	
	end

	def include_free(p)
		puts "------- Including a free #{p}"
	end

	def sign(card)
		puts "------- Signing #{card}"

	end

	def email(args)
		puts "------- Emailing #{args}"
	end
end

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
		elsif selection == "2"
			processOrder
		else
			end=true
		end
	end

	def optionFile
		puts "Enter filename containing rules: "
		file=gets.chomp
		rulesFile = file.open(file, "r")
		rescue Errno::ENOENT 
			#no such file or directory found
			optionFile
		end 
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
		if prod == 'D'
			return

		rescue ArgumentError
			# argument is incorrect
		end
	end

end


#book, membership, ski pass, ski video, ski boots, ski helmet
allProducts = Hash.new

def product(* p)
	if p.size > 1
		#throw exception
	end
	p=p[0]
	prod = Product.new(p)
	allProducts[p] = prod
end

def packing_slip(* slip)
	if slip.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	slip= slip[0]

end

def activate


end

def pay(* action)
	if action.size > 1
		#throw exception
	end
	action = action[0]
end

def include_free(* p)
	if p.size > 1
		#throw exception
	end
	p=p[0]
end

def sign(* card)
	if card.size > 1
		#throw exception
	end
	card = card[0]

end

def email(* args)
	if args.size > 1
		#throw exception
	end
	args = args[0]
end
load 'rules.txt'