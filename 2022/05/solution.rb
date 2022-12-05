#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true)
move_lines, stack_lines = input.partition { |line| line.match(/^move/) }

# populate stacks, max = 10
stacks = Array.new(10) { Array.new }
stack_lines.each do |line|
  line.scan(/[A-Z]/) do |crate|
    stack_index  = (Regexp.last_match.offset(0).first - 1)/4 + 1
    stacks[stack_index].unshift(crate)
  end
end

# make a deep copy for part 2
stacks_p2 = Marshal.load( Marshal.dump(stacks) )

# execute part 1 moves
move_lines.each do |line|
  num, from, to = line.scan(/\d+/).map(&:to_i)
  stacks[to].push(stacks[from].pop(num).reverse).flatten!
end

# calculate part 1 answer
ans = stacks.map { |s| s.last }.compact.join
puts ans

# execute part 2 moves
move_lines.each do |line|
  num, from, to = line.scan(/\d+/).map(&:to_i)
  stacks_p2[to].push(stacks_p2[from].pop(num)).flatten!
end

# calculate part 2 answer
ans = stacks_p2.map { |s| s.last }.compact.join
puts ans
