# pda_project

In order to run the rails app, you need the ThemeParksDB.sql script file from me. You would also need MySQL installed on your system.

First download the sql script file into a directory where you would run sql.

Move into the directory containing the sql script file and type "mysql -u username -p" or "mysql -u root -p" to enter the mysql console.

Once in the mysql console, create a database using the commands 'create database pda_development' and 'use pda_development'.
Then run "source ThemeParksDB.sql" to download the database entries.

Next clone the rails pda_project app into a preferable directory and bundle install by typing in the following commands:

1. git clone https://github.com/eddybanks/pda_project.git
2. bundle install
3. rails s


For the search feature inside the app to work, you need to have Sphinx installed in your machine. We use Thinking Sphinx Rails Gem to do the work but it uses Sphinx search engine so installation is needed by following this link (http://pat.github.io/thinking-sphinx/installing_sphinx.html).