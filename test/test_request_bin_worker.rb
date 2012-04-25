require 'yaml'
require 'iron_worker'

@config = YAML::load_file(File.expand_path(File.join("~", "Dropbox", "configs", "gist_worker", "test", "config.yml")))
IronWorker.configure do |config|
  config.token = @config['iron']['token']
  config.project_id = @config['iron']['project_id']
end

require_relative '../lib/request_bin_worker'
#require 'request_bin_worker'

worker = RequestBinWorker::Worker.new
worker.bin_url = "http://requestb.in/1hklas01"
worker.payload = {'hello'=>'world'}
worker.queue

status = worker.wait_until_complete
p status
puts "LOG:"
puts worker.get_log
