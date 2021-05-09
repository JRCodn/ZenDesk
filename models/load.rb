require 'rest-client'
require 'json'

class Load
  attr_reader :page, :api_error
  def initialize
    @url = "https://jrcodn.zendesk.com/api/v2/tickets.json?per_page=25"
    @api_error = nil
    @page = info(@url)
  end

  def info(url)
    rest = RestClient::Request.execute(
          method: :get,
          url: url,
          user: 'jaylreidy1@gmail.com',
          password: 'jrcodn321',
          headers: {"Content-Type" => "application/json"}
          )
    JSON.parse(rest, :symbolize_names => true)
    rescue RestClient::Exception
    "Sorry something went wrong with the API"
  end

  def next_page
    @page = info(@page[:next_page])
  end

  def prev_page
    @page = info(@page[:previous_page])
  end

  def find(id)
    info("https://jrcodn.zendesk.com/api/v2/tickets/#{id}")[:ticket]
  rescue
    @view.id_error
  end
end
