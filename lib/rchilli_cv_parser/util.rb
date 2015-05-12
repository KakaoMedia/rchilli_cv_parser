module RchilliCvParser
  module Util

    def extract_values(values, hash_node, struct_name = 'DETAILS')
      hash = {}

      values.each do |attr|
        hash[attr.to_underscore] = hash_node[attr]
      end

      struct ||= hash.to_struct(struct_name)
    end

    def extract_collection_values(raw_collection, attributes, node_name)
      collection = []
      
      if raw_collection.length > 0
        raw_collection.each_with_index do |node, i|
          collection << extract_values(attributes, node, "#{node_name}#{i+1}")
        end
      end

      collection
    end


 end
end