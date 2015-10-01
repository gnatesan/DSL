require 'singleton'
class Product

	attr_accessor:type
	attr_accessor:actions

	def initialize(type)
		arr = ["book", "membership", "ski pass", "video", "boots", "helmet"]
		if arr.include?type
			@type = type
			@actions = ""
		else
			#throw an error because the type is not a valid product
			raise NameError, "#{type} is not a valid product name"
		end
	end

	def callMethods
		act=actions.split(/!/)
		for line in act
			puts "#{line}"
			instance_eval(line)
		end
	end

	# add an action to the product to be called
	def add_action(action)
		@actions << "#{action} "
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

	include Singleton
	attr_accessor:current_product
	attr_accessor:allProducts

	def initialize
		@current_product=nil
		@allProducts = Hash.new
	end

	def contains(p)
		#checks to see if there is a product of type p in the hash
		allProducts.has_key?(p)
	end

	def get_product(p)
		#returns the Product of type p
		allProducts[p]
	end

	def add_product(p)
		#creates a product of type p and sets current_product equal to that
		prod = Product.new(p)
		@current_product = prod
		allProducts.store(p, prod)
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
				puts allProducts
			elsif selection == "2"
				processOrder
			else
				endExec=true
			end
		end
	end

	#tests rules.txt
	def mainMenuTest
		# presents the main menu until the user quits
		# allows the user to process orders
		endExec=false
		loadFile('rules.txt')
	end

	#tests badRules.txt
	def mainMenuTester
		# presents the main menu until the user quits
		# allows the user to process orders
		endExec=false
		loadFileTest('badRules.txt')
	end

	#test badRules2.txt (doesn't exist)
	def mainMenuTester2
		# presents the main menu until the user quits
		# allows the user to process orders
		endExec=false
		loadFileTest('badRules2.txt')
	end

	def loadFile(file)
		begin 
			load file
		rescue LoadError => e 
			puts "Reloading file"
			optionFile
		
		rescue NameError => e
			#put some messgae about nt beign able to load
			puts "aborting, cannot load file"
			abort

		end
	end

	def loadFileTest(file)
		load file
	end

	def optionFile
		puts "Enter filename containing rules: "
		file=gets.chomp
		# add a .txt extension if not there
		if !file.include?".txt"
			file=file+".txt"
		end
		rulesFile = File.open(file, "r")
		loadFile(rulesFile)
		rescue Errno::ENOENT 
			#no such file or directory found
			puts "No such file or directory found, reenter name"
			optionFile
	end
		

	def processOrder
		notStop=true
		while(notStop)
			puts "Enter product type or 'D' (done) to end: "
			prod=gets.chomp
			if prod=='d' || prod =='D'
				return
			end
			if !contains(prod)
				#the procuct is not defined
				puts "Undefined product: #{prod}"
				processOrder
				break
			end
			get_product(prod).callMethods
			end
	end
end

#book, membership, ski pass, ski video, ski boots, ski helmet

def product(* p)
	if p.size > 1
		#throw exception
	end
	p=p[0]
	#puts "#{p} is p"
	#check to see if product is a valid product
	if !(DSL.instance.contains p)
		DSL.instance.add_product p
	else
		DSL.instance.current_product = DSL.instance.get_product(p)
	end
	#puts "current product is #{DSL.instance.current_product.type}"
	#puts 
end

def activate(* args)
	# do error checking
	if args.size!=0
		raise ArgumentError, "Function takes no parameters"
	end
	DSL.instance.current_product.add_action("activate!")
end

def packing_slip(* slip)
	if slip.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	slip = slip[0]	
	DSL.instance.current_product.add_action("packing_slip(\"#{slip}\")!")
end

def pay(* action)
	if action.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	action = action[0]
	DSL.instance.current_product.add_action("pay(\"#{action}\")!")
end

def include_free(* p)
	if p.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	p=p[0]
	DSL.instance.current_product.add_action("include_free(\"#{p}\")!")
end

def sign(* card)
	if card.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	card = card[0]
	DSL.instance.current_product.add_action("sign(\"#{card}\")!")
end

def email(* args)
	if args.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	args = args[0]
	DSL.instance.current_product.add_action("email(\"#{args}\")!")
end
