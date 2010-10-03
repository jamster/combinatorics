module Combinatorics
  module PowerSet
    module Mixin
      #
      # Calculates the power-set of an Enumerable object.
      #
      # @return [Array]
      #   The power set.
      #
      # @example Power-set of an Array.
      #   [1,2,3].powerset
      #   # => [[], [3], [2], [2, 3], [1], [1, 3], [1, 2], [1, 2, 3]]
      #
      # @example Power-set on a Set of strings.
      #   Set['abc', 'xyz', '123'].powerset
      #   # => [#<Set: {}>, #<Set: {"123"}>, #<Set: {"xyz"}>,
      #         #<Set: {"abc"}>, #<Set: {"xyz", "123"}>,
      #         #<Set: {"abc", "123"}>, #<Set: {"abc", "xyz"}>,
      #         #<Set: {"abc", "xyz", "123"}>]
      #
      # @see http://johncarrino.net/blog/2006/08/11/powerset-in-ruby/
      #
      def powerset
        inject([self.class.new]) do |power_set,element|
          sub_set = []

          power_set.each do |i|
            sub_set << i
            sub_set << i + [element]
          end

          sub_set
        end
      end

      alias cartesian_product powerset

    end
  end
end
