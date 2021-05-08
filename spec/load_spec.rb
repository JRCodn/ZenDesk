require 'rspec'

begin
  require_relative "../models/load"
rescue LoadError => e
  if e.message =~ /loadd/
    describe "Load" do
      it "No load model" do
        fail
      end
    end
  else
    raise e
  end
end


describe "Load" do
  it "Check load class initializes @page as a hash" do
    load_page = Load.new
    expect(load_page.page).to be_a(Hash)
  end

  let(:url) { "https://jrcodn.zendesk.com/api/v2/tickets.json?per_page=25" }

  describe "Check tickets"
  it "Check if there's 25 tickets per page" do
    load_page = Load.new
    load_hash = load_page.info(url)
    expect(load_hash[:tickets].length).to eq(25)
  end

  describe "#find"
  it "Checks if the find ID finds a ticket" do
    load_page = Load.new
    find_id = load_page.find(2)
    expect(find_id[:id]).to eq(2)
  end

end
