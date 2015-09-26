#book, membership, ski pass, ski video, ski boots, ski helmet


def product(* p)
	if p.size > 1
		#throw exception
	end
	puts "------- Processing order for a: #{p}"
end

def packing_slip(* slip)
	if slip.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end
	puts "------- Printing packing slip for #{slip}"

end

def activate(* args)
	if args.size > 0
		#throw an exception
	end
	puts "------- Activating #{args}"

end

def pay(* action)
	if action.size > 1
		#throw exception
	end
	puts "------- Paying #{action}"	
end

load 'rules.qm'