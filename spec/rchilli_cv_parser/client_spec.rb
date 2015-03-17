require 'spec_helper'
require 'savon'

module RchilliCvParser

  describe Client do

    let(:client) { Client.new(user_key: ENV['RCHILLI_USER_KEY'], sub_user_id: ENV['RCHILLI_SUBUSER_ID'], version: ENV['RCHILLI_VERSION']   ) }

    describe "#init_client"
      it "should be an instance of Savon::Client" do
        expect(client.savon_client).to be_kind_of(Savon::Client)
      end
    end

    describe '#parse' do
      it "should return a parsed CV" do
        client = Client.new(user_key: ENV['RCHILLI_USER_KEY'],
                            sub_user_id: ENV['RCHILLI_SUBUSER_ID'],
                            version: ENV['RCHILLI_VERSION']   )

        result = client.parse('http://chrisblattman.com/documents/CV.Blattman.pdf')

        expect(result).to be_kind_of(Hash)
      end
    end

end