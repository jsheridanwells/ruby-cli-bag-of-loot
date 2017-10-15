require 'minitest/autorun'
require_relative 'lootbag'
require_relative 'controller'


class Lootbag_Tests < MiniTest::Test

	def setup
		@Bag = Bag.new
		@Child = Child.new('Test Child')
		@Toy = Toy.new('Ball')
	end

	def test_that_child_has_a_name
		assert @Child.child_name == 'Test Child'
	end

	def test_that_child_has_delivered_property_as_false
		refute @Child.delivered
	end

	def test_that_child_id_is_a_string
		assert_kind_of String, @Child.child_id
	end

	def test_that_toy_has_a_name
		assert @Toy.toy_name == 'Ball'
	end

	def test_that_toy_id_is_a_string
		assert_kind_of String, @Toy.toy_id
	end

	def test_that_toy_bag_is_a_hash
		assert_kind_of Hash, @Bag.toy_bag
	end

	def test_that_child_is_added_to_toy_bag
		@Bag.add_child(@Child)
		assert @Bag.toy_bag[@Child.child_id] == []
	end

	def test_that_toy_can_be_added_to_toy_bag
		@Bag.add_child(@Child)
		@Bag.add_toy(@Child.child_id, @Toy)
		assert @Bag.toy_bag[@Child.child_id][0] == @Toy.toy_id
	end

	def test_that_toy_can_be_removed_from_toy_bag
		@Bag.add_child(@Child)
		@Bag.add_toy(@Child.child_id, @Toy)
		@Bag.remove_toy(@Child.child_id, @Toy.toy_id)
		assert @Bag.toy_bag[@Child.child_id].length == 0
	end

	def test_that_all_toys_can_be_listed
		@Bag.add_child(@Child)
		@Bag.add_toy(@Child.child_id, @Toy)
		assert @Bag.list_all_children == @Bag.toy_bag.keys
	end

	def test_that_toys_can_be_returned_by_child_name
		@Bag.add_child(@Child)
		@Bag.add_toy(@Child.child_id, @Toy)
		assert @Bag.list_toy_by_child(@Child.child_id).length == 1
	end

	def test_that_bag_yaml_opens
		bag_hash = YAML::load(File.open('bag.yaml'))
		assert_kind_of Hash, bag_hash
	end

	def test_that_children_yaml_opens
		children_hash = YAML::load(File.open('children.yaml'))
		assert_kind_of Hash, children_hash
	end

	def test_that_toys_yaml_opens
		toys_hash = YAML::load(File.open('toys.yaml'))
		assert_kind_of Hash, toys_hash
	end

	

end
