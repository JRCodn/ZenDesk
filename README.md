ZenDesk Ticket Viewer

This is my version of a CLI program to display tickets from a ZenDesk profile.
I originally made this project to load all the tickets and store them in a ticket class, then store all the ticket instances in an array and pagenate
through them. But I decided that this code wasn't very scalable and very memory intensive. So I made the project in a way that could scale easily if 
there are more tickets.

To install this program make a directory to store it in and in the terminal in this new directory type:
`git clone https://github.com/JRcodn/ZenDesk.git`

Once cloned then type `bundle install` to install all the gems

Type `rspec` in terminal to run tests

The user and password for the API are read through an ENV File this can also be changed in the load class.
