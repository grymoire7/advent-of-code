#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true)

p1 = input
  .map { |line| line.chars.each_slice(line.size / 2).map(&:join) }
  .map { |pair| (pair.first.chars & pair.last.chars).join }
  .map { |letter| ('a'..'z').include?(letter) ? letter.ord - 96 : letter.ord - 38 }
  .sum

puts p1

p2 = input.each_slice(3).map do |group|
    group.map(&:chars).inject(&:&)
    .map { |letter| ('a'..'z').include?(letter) ? letter.ord - 96 : letter.ord - 38 }
    .first
end.sum

puts p2
