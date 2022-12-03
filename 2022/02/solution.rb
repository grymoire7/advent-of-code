#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true)

SCORES = {
  "A X" => [4, 3], "A Y" => [8, 4], "A Z" => [3, 8],
  "B X" => [1, 1], "B Y" => [5, 5], "B Z" => [9, 9],
  "C X" => [7, 2], "C Y" => [2, 6], "C Z" => [6, 7]
}.freeze

# PART 1
answer = input.inject(0) { |sum, line| sum + SCORES[line].first }
puts "Part 1 answer = #{answer}"

# PART 2
answer = input.inject(0) { |sum, line| sum + SCORES[line].last }
puts "Part 2 answer = #{answer}"
