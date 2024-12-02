# frozen_string_literal: true

class Base62 < ApplicationRecord
  ALPHABET = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first if number.zero? || number.nil?

    result = []

    while number.positive?
      index = number % BASE
      character = ALPHABET[index]
      result.prepend(character)
      number /= BASE
    end

    result.join
  end

  def self.decode(string)
    number = 0

    string.to_s.reverse.each_char.each_with_index do |character, index|
      power = BASE**index
      character_index = ALPHABET.index(character)

      number += character_index * power
    end

    number
  end
end
