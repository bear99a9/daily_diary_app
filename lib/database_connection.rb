# frozen_string_literal: true

require 'pg'

class DatabaseConnection
  def self.query(sql)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'diary_manager_test')
      connection.query(sql)
    else
      connection = PG.connect(dbname: 'diary_manager_test')
      connection.query(sql)
    end
  end
end
