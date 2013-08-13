# FlowFree

This is the code base for the FlowFree application.  It was built for boaters, fisherman, farmers or anybody who is reliant on knowledge of waterflows for their fun/lively-hood.

Currently due to hosting issues the steps to view the final product are as follows.

    git clone https://github.com/Patrickmnts/FlowFree.git
    cd FlowFree
    bundle install
    rake db:migrate

<<<<<<< HEAD
In the Rails Console run the following command to populate database with all of the latest information.
(this will take ~4 min to run entirely... there is a whole lot of data to gather)

    rails c
    Api.fetch

Launch the rails server in order to explore site

    rails s

Now head on over to Localhost:3000 and explore FlowFree!


FlowFree was built using Ruby 2.0, Rails 4, Foundation, HTML5, CSS3, Rspec & SQLite.
=======
In the Rails Console run
    Api.fetch
to update the database with a fresh batch of data.

Launch the rails server in order to explore site
    rails s

Now head on over to Localhost:3000 to explore FlowFree.


FlowFree was built using Ruby 2.0, Rails 4, Foundation, HTML5, CSS3, Rspec & Postgres SQL.
>>>>>>> working-branch

Created by: Vera Andjelkovic, Bryan Wahlstrom, Daniel Stark & Patrick Mounts
