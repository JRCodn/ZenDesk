require_relative 'load'
require_relative 'view'

class Controller
  def initialize
    @load = Load.new
    @view = View.new
  end

  def all
    @view.display_tickets(@load.page)
  end

  def find
    id = @view.ask_for_id
    @view.display_ticket(@load.find(id))
  rescue
    @view.id_error
  end

  def next_page
    @load.next_page
  rescue
    @view.pages('last')
  end

  def prev_page
    @load.prev_page
  rescue
    @view.pages('first')
  end
end
