require_relative 'controller'

command, param1, param2 = ARGV

# check command
case command
# if command is add
	when 'add'
		if !param1.to_s.empty? && !param2.to_s.empty?
			add_toy_to_bag(param1, param2)
		end

# if command is remove
	when 'remove'
		if !param1.to_s.empty? && !param2.to_s.empty?
			remove_toy(param1, param2)
		end

# if command is ls
	when 'ls'
		if param1.to_s.empty?
			list_all_toys
		# if command is ls with argument
		elsif !param1.to_s.empty?
			list_toys_by_child(param1)
		end

# if command is delivered
	when 'delivered'
		if !param1.to_s.empty?
			mark_delivered(param1)
		end

# if command is help
	when 'help'
		show_help
	end
