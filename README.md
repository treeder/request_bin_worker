# Execute a Gist on IronWorker

An IronWorker that runs any gist.

## Getting Started

You'll need an Iron.io account first, get one for free at [www.iron.io](http://www.iron.io).

### Install Gem

    sudo gem install gist_worker

### Create a gist

Here's an example one: https://gist.github.com/1989106

### Queue it up!

    # Configure IronWorker first
    IronWorker.configure do |config|
      config.token = 'MY_IRON_TOKEN'
      config.project_id = 'MY_IRON_PROJECT_ID'
    end
    # Now we just create our GistWorker and queue it up
    require 'gist_worker'
    worker = GistWorker::Worker.new
    worker.gist_id = "1989106"
    worker.gist_file = "tester.rb"
    worker.params = {'key1'=>'value', 'key2'=>3}
    worker.queue

Either look in [HUD](http://hud.iron.io) to see if it worked or:

### Optional: Wait for it to complete

    status = worker.wait_until_complete
    p status
    puts worker.get_log

