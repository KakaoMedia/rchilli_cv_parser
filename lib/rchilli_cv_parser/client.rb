require 'savon'

module RchilliCvParser

  class Client

    def initialize(options = {})
      @wsdl = options[:wsdl]
      @url = options[:url]
      @user_key = options[:userkey]
      @version = options[:version]
      @sub_user_id = options[:sub_user_id]

      @client = Savon.client(wsdl: @wsdl)
    end

    def operations
      @client.operations
    end

    def set_logger(logger)
      @logger = logger
    end

    def parse(operation, data_fields)
      begin
        response = get_response(operation)
      rescue Exception => e
        @logger.log(e) if @logger
        return nil
      end

      parse_xml(response.body, data_fields)
    end


    protected

    def send_request(operation)

      operation = operation.to_sym

      if operations.include?(operation)
        @response = @client.call(operation, message:
                                              { url: @url, userkey: @user_key, version: @version, subUserId: @sub_user_id })
      else
        raise InvalidOperationError
      end

    end


    def parse_xml(response, xml)
      #...
    end


  end

end