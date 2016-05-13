require 'yaml'
require 'iron_worker'

require_relative '../lib/request_bin_worker'
#require 'request_bin_worker'

RequestBinWorker::Worker.setup # can avoid this with the same behaviour as old one - store checksum

worker = RequestBinWorker::Worker.new
worker.bin_url = "http://requestb.in/1hklas01"
worker.payload = {'hello'=>'world'}
worker.queue

status = worker.wait_until_complete
p status
puts "LOG:"
puts worker.get_log
