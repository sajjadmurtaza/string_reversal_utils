# frozen_string_literal: true

require_relative 'product'
require_relative 'errors'

module Acme
  # Product catalogue for looking up products by code
  class Catalogue
    # @param products [Array<Product>]
    def initialize(products)
      @products = products.each_with_object({}) do |product, hash|
        hash[product.code] = product
      end
      freeze
    end

    # Find product by code
    # @param code [String]
    # @return [Product]
    # @raise [UnknownProductError] if product not found
    def find(code)
      @products.fetch(code) do
        raise UnknownProductError, "Unknown product code: #{code}"
      end
    end

    # @return [Array<Product>]
    def all
      @products.values
    end

    # @param code [String]
    # @return [Boolean]
    def exists?(code)
      @products.key?(code)
    end
  end
end
