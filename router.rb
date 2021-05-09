require_relative 'controller/controller'
require_relative 'view/view'
class Router

  def initialize(ticket_controller)
    @ticket_con = ticket_controller
    @view = View.new
    @running = true
  end

  def run
    print `clear`
    action = nil
    while @running
      @ticket_con.all if action != 1
      action = list_menu
      print `clear`
      route_list_menu(action)
    end
  end

  def stop
    @running = false
  end

  def list_menu
    puts "Please choose what you'd like to do"
    puts '1 - Find a ticket by ID'
    puts '2 - Next page'
    puts '3 - Back a page'
    puts '4 - List tickets'
    puts '5 - Quit'
    print '> '
    gets.chomp.to_i
  end

  def route_list_menu(action)
    case action
    when 1 then @ticket_con.find
    when 2 then @ticket_con.next_page
    when 3 then @ticket_con.prev_page
    when 5 then stop
    end
  end
end

klass = Controller.new

router = Router.new(klass)
router.run
