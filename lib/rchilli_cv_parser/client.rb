require 'savon'

module RchilliCvParser

  class Client

    attr_reader :savon_client

    def initialize(options = {})
      @url = options[:url]
      @user_key = options[:user_key]
      @version = options[:version]
      @sub_user_id = options[:sub_user_id]

      @savon_client = Savon.client(wsdl: @url)
    end

    def operations
      @savon_client.operations
    end

    def set_logger(logger)
      @logger = logger
    end

    def parse(cv_url)
      begin
        response = send_request(cv_url)
        cv_data = parse_xml(response.body[:parse_resume_response][:return])
        Applicant.new cv_data
      rescue Exception => e
        @logger.log(e) if @logger
      end
    end

    protected

    def send_request(cv_url)
      @savon_client.call(:parse_resume, message: {url: cv_url, userkey: @user_key, version: @version, subUserId: @sub_user_id})
    end

    def parse_xml(response)
      parser = Nori.new
      parser.parse response
    end

  end

end