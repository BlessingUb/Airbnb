require 'pg'
def setup_test_database
  connection = PG.connect(dbname: 'spaces_test')

  # Clear the spaces table
  connection.exec("TRUNCATE spaces;")
end