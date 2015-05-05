module RchilliCvParser
  class Applicant

    include RchilliCvParser::Util
  
    attr_reader :cv_response
    
    BASIC_DETAILS = ['FirstName', 'LastName', 'ResumeFileName', 'ParsingDate', 'TitleName', 'Middlename', 'DateOfBirth',
                      'FatherName', 'MotherName', 'MaritalStatus', 'Nationality', 'LanguageKnown', 'UniqueID', 'LicenseNo',
                      'PassportNo', 'PanNo', 'VisaStatus', 'Email', 'AlternateEmail', 'Phone', 'Mobile', 'FaxNo', 'Address',
                      'City', 'State', 'Country', 'ZipCode', 'PermanentAddress', 'PermanentCity', 'PermanentState', 'PermanentCountry',
                      'PermanentZipCode', 'Category', 'SubCategory', 'CurrentSalary', 'ExpectedSalary', 'Skills',
                      'Hobbies', 'JobProfile', 'CurrentEmployer', 'GapPeriod', 'NumberofJobChanged', 'AverageStay', 'Availability' ]

    EDUCATION_ATTRIBUTES = ['University', 'Degree', 'Year']
    EXPERIENCE_ATTRIBUTES = ['Employer', 'JobProfile', 'JobLocation', 'JobPeriod', 'StartDate', 'EndDate', 'JobDescription']
    WORKED_PERIOD = ['TotalExperienceInYear', 'TotalExperienceInMonths', 'TotalExperienceRange']
  
    def initialize(cv_response = {})
      @cv_response = cv_response
      @base_node = @cv_response['ResumeParserData']
    end

    def basic_details
      @basic_details_strucs ||= extract_values(BASIC_DETAILS, @base_node)
    end

    def experiences
      @experiences_collection ||= extract_collection_values(experiences_node, EXPERIENCE_ATTRIBUTES)
    end

    def educations
      @educations_collection ||= extract_collection_values(educations_node, EDUCATION_ATTRIBUTES)
    end

    def worked_period
      @worked_period_struc ||= extract_values(WORKED_PERIOD, @base_node['WorkedPeriod'])
    end

    protected

    def educations_node
      @base_node['SegregatedQualification'].nil? ? [] : @base_node['SegregatedQualification']['EducationSplit']
    end

    def experiences_node
      @base_node['SegregatedExperience'].nil? ? [] : @base_node['SegregatedExperience']['WorkHistory']
    end

  end
end