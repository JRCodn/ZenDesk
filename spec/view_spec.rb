require 'rspec'
require_relative "../view/view"

view = View.new

tickets = {
  tickets: [{
    id: '1',
    subject: 'Testing',
    created_at: '11/11/11',
    description: 'Testing stuff',
    submitter_id: 'Me'
  },
  {
    id: '2',
    subject: 'Stuff',
    created_at: '12/12/12',
    submitter_id: 'You'
  }]
}

describe "View" do
  it "Load class view" do
    expect(view).to be_a View
  end

  describe "#display_tickets"
  it "Should display a list of tickets" do
      expect do
      view.display_tickets(tickets)
      end.to output(/Testing/).to_stdout
  end

  describe "#display_ticket"
  it "Should display a ticket" do
    expect do
      view.display_ticket(tickets[:tickets][0])
    end.to output(/Testing stuff/).to_stdout
  end
end
