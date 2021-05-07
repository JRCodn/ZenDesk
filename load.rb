require 'rest-client'
require 'json'

class Load
  attr_reader :page
  def initialize
    @url = "https://jrcodn.zendesk.com/api/v2/tickets.json?per_page=25"
    @page = info(@url)
  end

  def info(url)
    res = RestClient::Request.execute method: :get,
                                      url: url,
                                      user: 'jaylreidy21@gmail.com',
                                      password: 'jrcodn321',
                                      headers: {"Content-Type" => "application/json"}
    JSON.parse(res, :symbolize_names => true)
    rescue RestClient::ExceptionWithResponse => err
    err
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

# c = Load.new

# p c.page
# p c.next_page
