require_relative 'lootbag'
require 'yaml'

LootBag = Bag.new

Children = {
	:children_arr => []
}

Toys = {
	:toys_arr => []
}


# open bag.yaml
LootBag.toy_bag = YAML.load_file('bag.yaml')
# open children.yaml
Children[:children_arr] = YAML.load_file('children.yaml')["children"]
# open toys.yaml
Toys[:toys_arr] = YAML.load_file('toys.yaml')["toys"]

p LootBag
p Children
p Toys

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

def check_arr(item, arr)

end

def add_new_child(name)
	new_child = Child.new(name)
	File.open('children.yaml', 'a') {|f| f.write new_child.to_yaml}
end

def add_new_toy(name)
	new_toy = Toy.new(name)
	File.open('toys.yaml', 'a') {|f| f.write new_toy.to_yaml}
end

# File.open('/tmp/test.yml', 'w') {|f| f.write d.to_yaml }

