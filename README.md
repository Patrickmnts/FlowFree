# FlowFree

This is the code base for the FlowFree application.  It was built for boaters, fisherman, farmers or anybody who is reliant on knowledge of waterflows for their fun/lively-hood.

Currently due to hosting issues the steps to view the final product are as follows.

    git clone https://github.com/Patrickmnts/FlowFree.git
    cd FlowFree
    bundle install
    rake db:migrate

In the Rails Console run
    Api.fetch
to update the database with a fresh batch of data.

Launch the rails server in order to explore site
    rails s

Now head on over to Localhost:3000 to explore FlowFree.


FlowFree was built using Ruby 2.0, Rails 4, Foundation, HTML5, CSS3, Rspec & Postgres SQL.

Created by: Vera Andjelkovic, Bryan Wahlstrom, Daniel Stark & Patrick Mounts
