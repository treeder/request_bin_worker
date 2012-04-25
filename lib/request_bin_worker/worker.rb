require 'iron_worker'
require 'json'
require 'rest'

module RequestBinWorker

  class Worker < IronWorker::Base

    attr_accessor :bin_url, :payload

    def run
      puts "Posting to #{bin_url}"
      p payload
      rest = Rest::Client.new
      rest.post(bin_url, :params=>payload)

    end

  end

end
