# require_relative 'controller/controller'
# require_relative 'router'

# klass = Controller.new
# router = Router.new(klass)
# router.run
require 'yaml'
thing = YAML.load_file('config.yml')
puts thing.inspect
