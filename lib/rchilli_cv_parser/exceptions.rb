module RchilliCvParser
  module Exceptions

    class RchilliCvError < StandardError
      attr_reader :data
      def initialize(data)
        @data = data
        super
      end
    end

    # Raised when an invalidad operation is provided
    class InvalidOperationError      < RchilliCvError; end

  end
end