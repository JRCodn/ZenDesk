class View
  def display_tickets(tickets)
    puts "Zendesk Ticket Viewer".center(100)
    printf(" %3s %-55s %-20s %s\n",
          "ID", "Subject".center(50), "Created at", "Created by"
    )
    puts ""
    tickets[:tickets].each do |t|
      printf("|%3s| %-50s | %-20s | %s |\n",
            t[:id],
            "#{t[:subject].center(50)}",
            "#{convert(t[:created_at])} |",
            t[:submitter_id]
    )
    end
    puts ""
  end

  def display_ticket(ticket)
    print `clear`
    puts "#{ticket[:id]} - #{ticket[:subject]}".center(100)
    puts "#{ticket[:description]}"
    puts ""
    puts "Created by: #{ticket[:submitter_id]} at #{convert(ticket[:created_at])}".center(100)
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
    puts ""
  end

  def error(error)
    puts "#{error}".center(50)
    puts ""
  end

  def convert(time)
    (Time.parse(time) + 36000).strftime("%d/%m/%y %H:%M")
  end
end
