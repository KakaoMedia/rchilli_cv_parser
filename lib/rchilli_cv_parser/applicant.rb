module RchilliCvParser
  class Applicant
    def initialize(cv_response = {})
      @cv_response = cv_response
    end

    def basic_details
      @basic_details ||= begin
        basic_details= {}
        basic_details['first_name'] = @cv_response['ResumeParserData']['FirstName']
        basic_details['last_name'] = @cv_response['ResumeParserData']['LastName']
        basic_details['email'] = @cv_response['ResumeParserData']['Email']
        basic_details['phone'] = @cv_response['ResumeParserData']['Phone']
        basic_details['nationality'] = @cv_response['ResumeParserData']['Nationality']
        basic_details['address'] = @cv_response['ResumeParserData']['Address']
        basic_details['city'] = @cv_response['ResumeParserData']['City']
        basic_details['State'] = @cv_response['ResumeParserData']['state']
        basic_details['country'] = @cv_response['ResumeParserData']['Country']
        basic_details['zip_code'] = @cv_response['ResumeParserData']['ZipCode']
        basic_details.to_struct('BasicDetails')
      end
    end

  end
end