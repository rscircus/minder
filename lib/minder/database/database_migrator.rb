module Minder
  class DatabaseMigrator
    attr_reader :database

    def initialize(database: nil)
      @database = database
    end

    def run
      ROM::SQL::Migration::Migrator.new(
        ROM.env.gateways[:default].connection,
        path: File.expand_path(File.dirname(__FILE__) + '/../../../db/migrate')
      ).run
    end
  end
end
