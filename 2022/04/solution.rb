#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true)
input.map! do |line|
  a, b, c, d = line.split(/[,-]/).map(&:to_i)
  [ (a..b), (c..d) ]
end

# Part 1
sum = input.map { |a, b| (a.cover?(b) || b.cover?(a)) ? 1 : 0 }.sum
p sum

# Part 2
sum = input.map { |a, b| (a.cover?(b.first) || b.cover?(a.first)) ? 1 : 0 }.sum
p sum

