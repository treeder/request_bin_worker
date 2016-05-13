require 'rest'

puts "Posting to #{params[:bin_url]}"
puts params[:payload]
rest = Rest::Client.new
rest.post(params[:bin_url], :params => params[:payload])
