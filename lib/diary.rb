# frozen_string_literal: true

require 'pg'
require_relative 'database_connection'

class Diary
  attr_reader :id, :title, :entry

  def initialize(id:, title:, entry:)
    @id = id
    @title = title
    @entry = entry
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM diary ORDER BY id desc')
    result.map do |row|
      Diary.new(id: row['id'],
                title: row['title'],
                entry: row['entry'])
    end
  end

  def self.add(title:, entry:)
    result = DatabaseConnection.query("INSERT INTO diary(title, entry) VALUES ('#{title}', '#{entry}') RETURNING id, title, entry;").first
    Diary.new(id: result['id'],
              title: result['title'],
              entry: result['entry'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("select * from diary where id = #{id};")
    Diary.new(id: result[0]['id'],
              title: result[0]['title'],
              entry: result[0]['entry'])
  end

  def self.delete(id:)
    DatabaseConnection.query("delete from diary where id = #{id}")
  end

  def self.edit(id:, title:, entry:)
    result = DatabaseConnection.query("update diary set title = '#{title}', entry = '#{entry}' where id = '#{id}' returning id, title, entry;")
    Diary.new(id: result[0]['id'],
              title: result[0]['title'],
              entry: result[0]['entry'])
  end
end
