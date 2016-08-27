Events
================

This is an example rails application that stores events from hosts and organizations.

Installation
-----------
This application requires:

- Ruby 2.2.2
- Rails 4.2.4

After cloning the github repository, run the following commands to install the application

```
git      clone https://github.com/mcdaley/events
cd       events
bundle   install
bin/rake db:create
bin/rake db:migrate
bin/rake db:test:prepare
bin/rake db:seed              # Load sample data
```

**Note**, if you have trouble configuring the database, you can manually 
create it with the following commands. My development machine environment 
is a little wacky, so I had to manually create the DB

```
sudo  -u postgres psql

psql: CREATE ROLE     events;
psql: CREATE DATABASE events_development with OWNER events;
```


Verify everything is installed correctly by starting the server and navigating 
to the home page.

```
bin/rails server
```

Open the browser to http://localhost:3000 and you should see the home page with a
list of all the events. Click on an organization or host to filter the list.

Retrieving events by organization
-------------

To retrieve the events by organization, use the 'Event.events_by_org scope. The method
takes 3 arguments:

* +Organization+ - Organization to retrieve events for.
* +N+            - Number of events to retrieve, default is 10
* +sort+         - Sort by timestamp, options are :asc, :desc and default is :desc

Example usage

```
org             = Organization.find(1)
events          = Event.events_by_org(org)
events_1_5_asc  = Event.events_by_org(org, 5, :asc)
```

Retrieving events by host
---------------

To retrieve the events by organization, use the 'Event.events_by_org scope. The method
takes 3 arguments:

* +Host+  - Host to retrieve events for.
* +N+     - Number of events to retrieve, default is 10
* +sort+  - Sort by timestamp, options are :asc, :desc and default is :desc

Example usage

```
host            = Host.find(1)
events          = Event.events_by_org(host)
events_1_5_asc_ = Event.events_by_org(host, 5, :asc)
```

Tests
-------------------------
Only completed model RSpec tests, which can be run by:

```
bin/rspec spec/models
```

Issues
-------------

