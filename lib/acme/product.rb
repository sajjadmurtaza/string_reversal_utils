# frozen_string_literal: true

require_relative 'money'
require_relative 'errors'

module Acme
  # Immutable product value object
  class Product
    attr_reader :code, :name, :price

    # @param code [String] product code (e.g., "R01")
    # @param name [String] product name
    # @param price [Money] product price
    def initialize(code:, name:, price:)
      validate_code!(code)
      @code = code.freeze
      @name = name.freeze
      @price = price
      freeze
    end

    # @param other [Product]
    # @return [Boolean]
    def ==(other)
      other.is_a?(Product) &&
        code == other.code &&
        name == other.name &&
        price == other.price
    end

    private

    def validate_code!(code)
      return if code.is_a?(String) && !code.empty?

      raise InvalidConfigError, 'Product code must be a non-empty string'
    end
  end
end
