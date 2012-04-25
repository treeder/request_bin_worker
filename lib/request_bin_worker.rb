require 'iron_worker_ng'

module RequestBinWorker
  class Worker
    attr_accessor :bin_url
    attr_accessor :payload

    @@client = IronWorkerNG::Client.new

    def self.setup
      code = IronWorkerNG::Code::Ruby.new(:exec => File.dirname(__FILE__) + '/request_bin_worker/worker.rb', :name => 'RequestBinWorker')
      code.gem 'rest'

      @@client.codes.create(code)
    end

    def queue
      @task = @@client.tasks.create('RequestBinWorker', :bin_url => @bin_url, :payload => @payload) 
    end

    def wait_until_complete
      return if @task.nil?

      @@client.tasks.wait_for(@task.id).status
    end

    def get_log
      return "" if @task.nil?

      @@client.tasks.log(@task.id)
    end
  end
end
