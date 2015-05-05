module RchilliCvParser
  module Util

    def extract_values values, hash_node
      hash = {}

      values.each do |attr|
        hash[attr.to_underscore] = hash_node[attr]
      end

      struct ||= hash.to_struct('BasicDetails')
    end

    def extract_collection_values(raw_collection, attributes)
      collection = []
      
      if raw_collection.length > 0
        raw_collection.each do |node|
          collection << extract_values(attributes, node)
        end
      end

      collection
    end


 end
end