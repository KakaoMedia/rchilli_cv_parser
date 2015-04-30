module RchilliCvParser
  module CoreExtensions
    module Hash
      def to_struct(struct_name)
        Struct.new(struct_name,*keys).new(*values)
      end
    end
  end
end

class Hash
  include RchilliCvParser::CoreExtensions::Hash
end

