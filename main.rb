require_relative 'controller'

command, param1, param2 = ARGV

# check command
case command
# if command is add
	when 'add'
		if !param1.to_s.empty? && !param2.to_s.empty?
			add_toy_to_bag(param1, param2)
		end
	end
# if command is remove

# if command is ls

	# if command is ls with argument

# if command is delivered

# if command is help

# end