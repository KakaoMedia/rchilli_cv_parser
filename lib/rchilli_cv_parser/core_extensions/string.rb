module RchilliCvParser
  module CoreExtensions
    module String
      def to_underscore!
        gsub!(/(.)([A-Z])/,'\1_\2')
        downcase!
      end

      def to_underscore
        dup.tap { |s| s.to_underscore! }
      end
    end
  end
end

class String
  include RchilliCvParser::CoreExtensions::String
end