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

	attr_accessor:current_product

	def initialize
		@current_product=nil
	end

	hash = {}

	def contains(p)
		#checks to see if there is a product of type p in the hash
	end

	def get_product(p)
		#returns the Product of type p
	end

	def add_product(p)
		#creates a product of type p and sets current_product equal to that

	end

	def mainMenu
		# presents the main menu until the user quits
		# allows the user to process orders
		endExec=false
		while(!endExec)
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
				endExec=true
			end
		end
	end

	def optionFile
		puts "Enter filename containing rules: "
		file=gets.chomp
		# add a .txt extension if not there
		if !file.include?".txt"
			file=file+".txt"
		end
		rulesFile = File.open(file, "r")
		rescue Errno::ENOENT 
			#no such file or directory found
			optionFile
		end 
	end


	def processOrder
		puts "Enter product type or 'D' (done) to end: "
		prod=gets.chomp
		if prod=='d' || prod =='D'
			return
		end
		#process product

		raise ArgumentError, "Undefined product: #{prod}"
			# argument is incorrect
	end
end

def product(p)
	#check to see if product is a valid product
	if !(DSL.instance.contains p)
		DSL.instance.add_product Product.new(p)
	else
		DSL.instance.current_product = DSL.instance.get_product(p)
	end
end

def packing_slip(slip)
	# do error checking
	if slip.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	slip= slip[0]
	# how to add parameter and name of fn (packing_slip)
	DSL.instance.current_product.add_action(slip)
end

def activate(* args)
	# do error checking
	if args.size!=0
				raise ArgumentError, "Function takes no parameters"
	end
	DSL.instance.current_product.add_action()
end

dsl=DSL.new
dsl.mainMenu