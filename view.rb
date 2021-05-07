class View
  def display_tickets(tickets)
    tickets[:tickets].each do |ticket|
      puts "ID: #{ticket[:id]} - #{ticket[:subject]} "\
      "|Last update: #{convert(ticket[:created_at])}| "\
      "|Created by: #{ticket[:submitter_id]}]|"
    end
    puts ""
  rescue
    puts "Sorry there may be an error with the API"
  end

  def display_ticket(ticket)
    print `clear`
    puts "#{ticket[:id]} - #{ticket[:subject]}"
    puts "#{ticket[:description]}"
    puts ""
    puts "Created by: #{ticket[:submitter_id]} at #{convert(ticket[:created_at])}"
    puts ""
  end

  def ask_for_id
    puts "Whats the id for the ticket you'd like to look at?"
    print "> "
    gets.chomp.to_i
  end

  def pages(location)
    puts "You're on the #{location} page".center(100)
    puts ""
  end

  def id_error
    puts "Sorry there was an error with that id".center(100)
  end

  def convert(time)
    (Time.parse(time) + 36000).strftime("%d/%m/%y %H:%M")
  end
end
