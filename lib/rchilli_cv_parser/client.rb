require 'savon'

module RchilliCvParser

  class Client

    attr_reader :savon_client

    def initialize(options = {})
      @user_key = options[:user_key]
      @version = options[:version]
      @sub_user_id = options[:sub_user_id]
      init_parser
    end

    def init_parser
      @savon_client = Savon.client(wsdl: 'http://java.rchilli.com/RChilliParser/services/RChilliParser?wsdl')
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
      rescue Exception => e
        @logger.log(e) if @logger
        puts e
      end

      parse_xml(response.body[:parse_resume_response][:return])
    end


    protected

    def send_request(cv_url)
        @savon_client.call(:parse_resume, message: { url: cv_url, userkey: @user_key, version: @version, subUserId: @sub_user_id })
    end


    def parse_xml(response)
      parser = Nori.new
      parser.parse response
    end


  end

end