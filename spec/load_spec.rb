require 'rspec'
require_relative "../models/load"

load_page = Load.new

describe "Load" do
  it "Check load class initializes @page as a hash" do
    expect(load_page).to be_a Load
  end

  let(:url) { "https://jrcodn.zendesk.com/api/v2/tickets.json?per_page=25" }

  describe "Check tickets"
  it "Check if there's 25 tickets per page" do
    load_hash = load_page.info(url)
    expect(load_hash[:tickets].length).to eq(25)
  end

  describe "#find"
  it "Checks if the find ID finds a ticket" do
    find_id = load_page.find(2)
    expect(find_id[:id]).to eq(2)
  end

  describe "#next_page"
  it "Checks if next_page finds the next page" do
    expect(load_page.next_page[:tickets][0][:id]).to eq(26)
  end

  describe "#previous_page"
  it "Checks if previous_page finds a previous_page" do
    expect(load_page.prev_page[:tickets][0][:id]).to eq(1)
  end
end

