module RchilliCvParser
  class Applicant
  
    attr_reader :cv_response
    
    BASIC_DETAILS = ['FirstName', 'LastName', 'Email', 'Phone', 'Nationality', 'Address', 'City', 'State',
                     'Country', 'ZipCode', 'Address', 'DateOfBirth']

    ADDITIONAL_DETAILS = ['Gender', 'Category', 'SubCategory', 'CurrentSalary', 'Qualification', 'VisaStatus',
                          'MaritalStatus', 'Hobbies', 'JobProfile', 'CurrentEmployer']

  
    def initialize(cv_response = {})
      @cv_response = cv_response
    end
    
    def base_node
      @cv_response['ResumeParserData']
    end
    
    ["basic_details", "additional_details"].each do |action|
  	  define_method(action) do
          hash, result = {}
          Applicant.const_get(action.upcase).each do |attr|
            hash[attr.to_underscore] = base_node[attr]
          end
          result ||= hash.to_struct(action.camelize)
      end
    end

  end
end