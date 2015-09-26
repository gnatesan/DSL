#book, membership, ski pass, ski video, ski boots, ski helmet


def product(* p)
	if p.size > 1
		#throw exception
	end

end

def packing_slip(* slip)
	if slip.size > 1
		#throw exception
		raise ArgumentError, "Function takes one parameter"
	end

end

def activate(* args)
	if args.size > 0
		#throw an exception
	end

end

def pay(* action)
	if action.size > 1
		#throw exception
	end

end

load 'rules.qm'