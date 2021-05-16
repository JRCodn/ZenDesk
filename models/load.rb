require 'rest-client'
require 'json'
require 'dotenv'
Dotenv.load

class Load
  attr_reader :api_error, :url
  attr_accessor :page
  def initialize
    @url = "https://jrcodn.zendesk.com/api/v2/tickets.json?per_page=25"
    @api_error = nil
    @page = info(@url)
  end

  # Retrieve the api for url and parse it with JSON
  def info(url)
    rest = RestClient::Request.execute(
          method: :get,
          url: url,
          user: 'jaylreidy21@gmail.com',
          password: ENV['KEY'],
          headers: {"Content-Type" => "application/json"}
          )
    JSON.parse(rest, :symbolize_names => true)
    rescue RestClient::Exception
    "Sorry something went wrong with the API"
  end

  # Retrieves the next_page url and parses it
  def next_page
    @page = info(@page[:next_page])
  end

  # Retrieves the previous_page url and parses it
  def prev_page
    @page = info(@page[:previous_page])
  end

  # Find a single ticket
  def find(id)
    info("https://jrcodn.zendesk.com/api/v2/tickets/#{id}")[:ticket]
  rescue
    @view.id_error
  end

end
