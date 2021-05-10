require_relative 'controller/controller'
require_relative 'router'

klass = Controller.new
router = Router.new(klass)
router.run
