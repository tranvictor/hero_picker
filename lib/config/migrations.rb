require 'sequel'

module HeroPicker
  class Migration
    def self.migrate!
      db = Sequel.connect('sqlite://db/hero_picker_development.db')

      db.create_table! :heroes do
        primary_key :id
        String      :name
      end
    end
  end
end
