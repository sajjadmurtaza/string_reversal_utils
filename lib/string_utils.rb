# frozen_string_literal: true

module StringUtils
  def self.my_reverse(string)
    raise ArgumentError, 'Expected a String' unless string.is_a?(String)
    return '' if string.empty?

    reversed = +''
    i = string.length - 1
    while i >= 0
      reversed << string[i]
      i -= 1
    end
    reversed
  end
end
