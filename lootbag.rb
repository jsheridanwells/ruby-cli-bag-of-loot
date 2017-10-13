require 'securerandom'

class Bag
	attr_accessor :toy_bag

	def initialize
		@toy_bag = {}
	end

	def add_child(child)
		@toy_bag[child.child_id.to_sym] = child.child_id
		@toy_bag[child.child_id] = []
	end

	def add_toy(child_id, toy)
		@toy_bag[child_id].push(toy.toy_id)
	end

end

class Child
	attr_accessor :child_name, :delivered, :child_id

	def initialize(name)
		@child_name = name
		@delivered = false
		@child_id = SecureRandom.uuid
	end

end

class Toy
	attr_accessor :toy_name, :toy_id

	def initialize(name)
		@toy_name = name
		@toy_id = SecureRandom.uuid
	end

end