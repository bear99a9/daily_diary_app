# frozen_string_literal: true

require 'pg'

def truncate_test_database
  connection = PG.connect(dbname: 'diary_manager_test')
  connection.query('TRUNCATE diary;')
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'diary_manager_test')
  connection.query("SELECT * FROM listing WHERE id = #{id};").first
end
