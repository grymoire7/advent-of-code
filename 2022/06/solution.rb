#!/usr/bin/env ruby

input = File.readlines('input.txt', chomp: true)

p input.first.chars.each_cons(4).to_a.index { |a| a.uniq.size == 4 } + 4

p input.first.chars.each_cons(14).to_a.index { |a| a.uniq.size == 14 } + 14
