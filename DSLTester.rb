require 'minitest/autorun'
require_relative 'dslMain'

class DSLTester < Minitest::Test

=begin
	def test_badrules
		DSL.instance.mainMenu
		assert_raise_with_message(NameError, "books is not a valid product name")
	end
=end

	def test_bad_file_name
		#testing with badRules2.txt , which doesn't exist
		assert_raise_with_message(Errno::ENOENT, "cannot load such file -- badRules2.txt")
	end

	def test_load
		#testing with rules.txt, which exists and is valid
		DSL.instance.mainMenu
		assert_equals(6, DSL.instance.allProducts.size)
		assert(DSL.instance.allProducts.contains("book"))
		assert(DSL.instance.allProducts.contains("video"))
		assert(DSL.instance.allProducts.contains("ski pass"))
		assert(DSL.instance.allProducts.contains("membership"))
		assert(DSL.instance.allProducts.contains("boots"))
		assert(DSL.instance.allProducts.contains("helmet"))
	end
end