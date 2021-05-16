require_relative '../models/load'
require_relative '../view/view'

class Controller
  attr_reader :load
  def initialize
    @load = Load.new
    @view = View.new
  end

  # Display current 25 tickets
  def all
    @view.display_tickets(@load.page)
  rescue
    @view.error(@load.page)
  end

  # Find a singe ticket
  def find
    id = @view.ask_for_id
    @view.display_ticket(@load.find(id))
  rescue
    @view.id_error
  end

  # See next page
  def next_page
    @load.next_page
  rescue
    @view.pages('last')
  end

  # See previous page
  def prev_page
    @load.prev_page
  rescue
    @view.pages('first')
  end
end
