module RchilliCvParser
  module Util

    def extract_values(values, hash_node, struct_name = 'DETAILS')
      hash = {}

      values.each do |attr|
        if hash_node.kind_of?(Hash)
          hash[attr.underscore] = hash_node[attr]
        end
      end

      struct ||= hash.to_struct(struct_name)
    end

    def extract_collection_values(raw_collection, attributes, node_name)
      collection = []

      if raw_collection.kind_of?(Hash)
        collection << extract_values(attributes, raw_collection, node_name)
      elsif raw_collection.kind_of?(Array)
        raw_collection.each_with_index do |node, i|
          collection << extract_values(attributes, node, "#{node_name}#{i+1}")
        end
      end

      collection
    end


 end
end