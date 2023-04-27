# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

new_activity = Activity.new

puts new_activity.inspect

salesguy = Salesperson.find_by({"first_name" => "Abe"})
jeff = Contact.find_by({"first_name" => "Jeff"})

new_activity["created"] = "4/26/23"
new_activity["notes"] = "bowling with amazon"
new_activity["salesperson_id"] = salesguy["id"]
new_activity["contact_id"] = jeff["id"]
new_activity.save # inserts into the table

puts new_activity.inspect

activity_2 = Activity.new

puts activity_2.inspect

craig = Contact.find_by({"first_name" => "Craig"})

activity_2["created"] = "4/25/23"
activity_2["notes"] = "kbbq with apple"
activity_2["salesperson_id"] = salesguy["id"]
activity_2["contact_id"] = craig["id"]
activity_2.save # inserts into the table

puts activity_2.inspect

activity_3 = Activity.new

puts activity_3.inspect

tim = Contact.find_by({"first_name" => "Tim"})

activity_3["created"] = "4/23/23"
activity_3["notes"] = "skating with apple"
activity_3["salesperson_id"] = salesguy["id"]
activity_3["contact_id"] = tim["id"]
activity_3.save # inserts into the table

puts activity_3.inspect


# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

relevant_activity = Activity.where({"salesperson_id" => salesguy["id"], "contact_id" => tim["id"]})

puts relevant_activity.inspect

puts "Activities between ..."
for activity in relevant_activity
puts activity["notes"]

end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
