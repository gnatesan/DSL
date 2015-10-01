require 'minitest/autorun'
require_relative 'dslMain'

class DSLTester < Minitest::Test

	def test_bad_file_name
		#testing with badRules2.txt , which doesn't exist
		assert_raises(NameError) {DSL.mainMenuTester2}
		
	end

	def test_badrules 
		#testing with badRules.txt , contains incorrect format
		assert_raises(NameError) {DSL.mainMenuTester}
	end

	def test_load
		#testing with rules.txt, which exists and is valid
		DSL.instance.mainMenuTest
		assert_equal(6, DSL.instance.allProducts.size)
		assert(DSL.instance.allProducts.has_key?("book"))
		assert(DSL.instance.allProducts.has_key?("video"))
		assert(DSL.instance.allProducts.has_key?("ski pass"))
		assert(DSL.instance.allProducts.has_key?("membership"))
		assert(DSL.instance.allProducts.has_key?("boots"))
		assert(DSL.instance.allProducts.has_key?("helmet"))
	end
end