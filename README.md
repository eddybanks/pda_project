# pda_project

In order to run the rails app, you need the ThemeParksDB.sql script file from me. You would also need MySQL installed on your system.

First download the sql script file into a directory where you would run sql.

Move into the directory containing the sql script file and type "mysql -u username -p" or "mysql -u root -p" to enter the mysql console.

Once in the mysql console, create a database using the commands 'create database pda_development' and 'use pda_development'.
Then run "source ThemeParksDB.sql" to download the database entries.

Next clone the rails pda_project app into a preferable directory, bundle install and load the database from schema.rb by typing in the following commands:

1. git clone https://github.com/eddybanks/pda_project.git
2. bundle install
3. rake db:schema:load
4. rake db:migrate
5. rails s

