require 'rspec'
require_relative "../controller/controller"

load_con = Controller.new

describe "Controller" do
  it "Load class Controller" do
    expect(load_con).to be_a Controller
  end

  describe "#all"
  it "Prints tickets with a time stamp" do
    expect do
      load_con.all
      end.to output(/\d{2}:\d{2}/).to_stdout
  end

  describe "#find"
  it "finds a single ticket" do
    allow_any_instance_of(Controller).to receive(:all).and_return(/\d{2}:\d{2}/)
  end

  describe "#next_page"
  it "Goes to next page" do
    expect(load_con.next_page).to be_a(Hash)
  end

  describe "#next_page"
  it "Goes to next page" do
    expect(load_con.prev_page).to be_a(Hash)
  end
end
