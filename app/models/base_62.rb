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
  end
end
