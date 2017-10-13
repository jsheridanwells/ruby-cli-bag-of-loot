require_relative 'lootbag'
require 'json'

bag_data = File.open('bag.json', 'a+')

bag_data.write('something')

p bag_data.read

LootBag = Bag.new

