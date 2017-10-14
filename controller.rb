require_relative 'lootbag'
require 'yaml'

# open bag.yaml

# open children.yaml

# open toys.yaml


# add a toy to the bag by child

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
