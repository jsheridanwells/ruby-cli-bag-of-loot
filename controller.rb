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
	child_id = ''
	toy_id = ''
	# check the children hash for child_name
	if !check_arr(child_name, Children["children"], "child_name")
		# if empty, add a new child to children
		add_new_child(child_name)
		# get child_id
		child_id = get_id(child_name, Children["children"], "child_name", "child_id")
	else
		# else if included, get child_id
		child_id = get_id(child_name, Children["children"], "child_name", "child_id")
	end
	# check the toys hash for toy_name
	if !check_arr(toy_name, Toys["toys"], "toy_name")
		# if empty, add a new toy to toys
		add_new_toy(toy_name)
		# get toy_id
		toy_id = get_id(toy_name, Toys["toys"], "toy_name", "toy_id")
	else
		# else if included, get toy_id
		toy_id = get_id(toy_name, Toys["toys"], "toy_name", "toy_id")
	end
	# check bag keys for child_id
	if !LootBag.toy_bag.key?(child_id)
		# if does not exist create a new key
		LootBag.toy_bag[child_id] = [toy_id]
		# else if exists
	else
		# push toy_id
		LootBag.toy_bag[child_id].push(toy_id)
	end
	update_file('bag.yaml', LootBag.toy_bag)
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

# checks an array of hashes for an item name, returns associated id
def get_id(item_name, arr, name_key, id_key)
	(arr.select {|hash| hash[name_key] == item_name})[0][id_key]
end

# overwrites specifeid .yaml files with hash
def update_file(file, hash)
	update_file = File.open(file, 'w')
	update_file.write(hash.to_yaml)
end

 # adds new child to Children hash, writes it to children.yaml
def add_new_child(name)
	new_child = Child.new(name)
	new_hash = {}
	new_child.instance_variables.each {|item| new_hash[item.to_s.delete('@')] = new_child.instance_variable_get(item)}
	Children["children"].push(new_hash)
	update_file('children.yaml', Children)
end

 # adds new toy to Toys hash, writes it to toys.yaml
def add_new_toy(name)
	new_toy = Toy.new(name)
	new_hash = {}
	new_toy.instance_variables.each {|item| new_hash[item.to_s.delete('@')] = new_toy.instance_variable_get(item)}
	Toys["toys"].push(new_hash)
	update_file('toys.yaml', Toys)
end

# list name of each child in loot bag and each toy the child gets
def list_all_toys
	child_ids = LootBag.toy_bag.keys
	names = child_ids.map {|key| hash_query(key, Children["children"], "child_id", "child_name")}
	toys = []
	child_ids.each_with_index do |id, index|
		toys = LootBag.toy_bag[id].map {|key| hash_query(key, Toys["toys"], "toy_id", "toy_name")}
		puts "#{names[index]} wants:"
		puts toys
	end
end

# takes child's name, lists all toys in array associated with child
def list_toys_by_child(child_name)
	id = hash_query(child_name, Children["children"], 'child_name', 'child_id')
	toys = LootBag.toy_bag[id].map {|id| hash_query(id, Toys["toys"], "toy_id", "toy_name")}
	puts "#{child_name} wants: "
	puts toys
end

# sets value of delivered to true for specified child
def mark_delivered(search_name)
	Children["children"].select {|item| item["child_name"] == search_name}[0]["delivered"] = true
	update_file('children.yaml', Children)
end

# removes toy from toy array specified by child
def remove_toy(child_name, toy_name)
	child_id = hash_query(child_name, Children["children"], 'child_name', 'child_id')
	toy_id = hash_query(toy_name, Toys["toys"], 'toy_name', 'toy_id')
	LootBag.toy_bag[child_id].delete(toy_id)
	update_file('bag.yaml', LootBag.toy_bag)
end

# shows help message to user
def show_help
	puts "These are the following commands that this application accepts:"
	puts "\t 'add' (child name) (toy name) - gives a child a new toy"
	puts "\t 'remove' (toy name) (child name) - takes away the child's toy"
	puts "\t 'ls' - lists all children and the toys they are receiving"
	puts "\t 'ls' (child name) - lists all the toys that one child is receiving"
	puts "\t 'delivered' (child name) - marks that the toys have been delivered to the child"
	puts "\t 'help'  - shows all of the available commands that this application accepts"


end

# seaches array of hashes for given value, returns other value by key
def hash_query(search_str, arr, search_key, return_key)
	if arr != nil
		arr.find {|hash| hash[search_key] == search_str}[return_key]
	end
end
