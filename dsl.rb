#book, membership, ski pass, ski video, ski boots, ski helmet


def product(* p)
	if p.size > 1
		#throw exception
	end
	p=p[0]
	puts
	puts "------- Processing order for a #{p}"
end

def packing_slip(* slip)
	if slip.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	slip= slip[0]
	puts "------- Printing packing slip for #{slip}"

end

def activate
	puts "------- Activating membership"

end

def pay(* action)
	if action.size > 1
		#throw exception
	end
	action = action[0]
	puts "------- Paying #{action}"	
end

def include_free(* p)
	if p.size > 1
		#throw exception
	end
	p=p[0]
	puts "------- Including a free #{p}"
end

def sign(* card)
	if card.size > 1
		#throw exception
	end
	card = card[0]
	puts "------- Signing #{card}"

end

def email(* args)
	if args.size > 1
		#throw exception
	end
	args = args[0]
	puts "------- Emailing #{args}"
end
load 'rules.txt'