# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

puts "There are #{Salesperson.all.count} salespeople"

# 2. insert 1-2 rows in salespeople table.

new_salesperson = Salesperson.new

puts new_salesperson.inspect

new_salesperson["first_name"] = "Abe"
new_salesperson["last_name"] = "Lincoln"
new_salesperson["email"] = "h8theatre@whitehouse.gov"
new_salesperson.save # inserts into the table

puts new_salesperson.inspect

puts "There are #{Salesperson.all.count} salespeople"

salesperson_2 = Salesperson.new

puts salesperson_2.inspect

salesperson_2["first_name"] = "George"
salesperson_2["last_name"] = "Washington"
salesperson_2["email"] = "first@whitehouse.gov"
salesperson_2.save # inserts into the table

puts salesperson_2.inspect

puts "There are #{Salesperson.all.count} salespeople"

# 3. write code to display how many salespeople rows are in the database

puts "Salespeople: #{Salesperson.all.count}"

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.
abe = Salesperson.find_by({"first_name" => "Abe"})
puts abe["email"]
abe["email"] = "honest@whitehouse.gov"
abe.save # update row in table
puts abe["email"]

# CHALLENGE:
# 5. write code to display each salesperson's full name
george = Salesperson.find_by({"first_name" => "George"})

puts "Salespeople: #{Salesperson.all.count}"
puts abe["first_name"] + " " + abe["last_name"]
puts george["first_name"] + " " + george["last_name"]

# more efficient way to do the names, with loops
all_salespeople = Salesperson.all
for salesperson in all_salespeople
    first_name = salesperson["first_name"]
    last_name = salesperson["last_name"]
    puts "#{first_name} #{last_name}"
end


# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
