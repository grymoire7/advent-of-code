#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true)
move_lines, stack_lines = input.partition { |line| line.match(/^move/) }

# populate stacks, max stacks = 10
stacks = Array.new(10) { Array.new }
stack_lines.each do |line|
  line.scan(/[A-Z]/) do |crate|
    stack_index  = (Regexp.last_match.offset(0).first - 1)/4 + 1
    stacks[stack_index].unshift(crate)
  end
end

process_moves = ->(stacks, transfer_type) {
  stacks_clone = Marshal.load( Marshal.dump(stacks) )
  move_lines.each do |line|
    num, from, to = line.scan(/\d+/).map(&:to_i)
    stacks_clone[to].push(stacks_clone[from].pop(num).send(transfer_type)).flatten!
  end
  _ans = stacks_clone.map { |s| s.last }.compact.join
}

# part 1
puts process_moves.call(stacks, :reverse)
# part 2
puts process_moves.call(stacks, :itself)
