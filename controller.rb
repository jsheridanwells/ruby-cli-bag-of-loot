require_relative 'lootbag'
require 'yaml'

LootBag = Bag.new

# open bag.yaml
LootBag.toy_bag = YAML.load_file('bag.yaml')
# open children.yaml
Children = YAML.load_file('children.yaml')
# # open toys.yaml
Toys = YAML.load_file('toys.yaml')



# add a toy to the bag by child
def add_toy_to_bag(toy_name, child_name)
	# check the children hash for child_name

		# if empty, add a new child to children

			# get child_id

		# else if included, get child_id

	# check the toys hash for toy_name

		# if empty, add a new toy to toys

			# get toy_id

		# if included, get toy_id

	# check bag keys for child_id

		# if does not exist

			# create a new key

			# add toy_id

		# else if exists

			 # push toy_id
end


 # checks an array of hashes to see if hash contains an item
def check_arr(item, arr, key)
	arr.each do |hash|
		if hash[key] === item
			return true
		end
	end
	return false
end


 # adds new child to Children hash, writes it to children.yaml
def add_new_child(name)
	new_child = Child.new(name)
	new_hash = {}
	new_child.instance_variables.each {|item| new_hash[item.to_s.delete('@')] = new_child.instance_variable_get(item)}
	Children["children"].push(new_hash)
	update_file = File.open('children.yaml', 'w')
	update_file.write(Children.to_yaml)
end

 # adds new toy to Toys hash, writes it to toys.yaml
def add_new_toy(name)
	new_toy = Toy.new(name)
	new_hash = {}
	new_toy.instance_variables.each {|item| new_hash[item.to_s.delete('@')] = new_toy.instance_variable_get(item)}
	Toys["toys"].push(new_hash)
	update_file = File.open('toys.yaml', 'w')
	update_file.write(Toys.to_yaml)
end











