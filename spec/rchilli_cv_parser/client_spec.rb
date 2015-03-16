require 'spec_helper'

module RchilliCvParser

  describe Client do

    let(:client) { Client.new(key: ENV['RCHILLI_KEY'], url: DataHelpers::SAMPLE_CV_URLS[0]  ) }



  end

end