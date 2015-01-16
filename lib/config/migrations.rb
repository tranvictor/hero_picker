require 'sequel'

module HeroPicker
  class Migration
    def self.migrate!
      db = Sequel.connect('sqlite://db/hero_picker_development.db')

      db.create_table! :heroes do
        primary_key :id
        String      :name
        String      :dotamax_id
        String      :image
      end

      db.create_table! :hero_vs_hero_stats do
        primary_key :id
        String      :first_hero
        String      :second_hero
        Float       :anti_index
        Float       :win_rate
        Integer     :match_count
      end

      db.create_table! :hero_coop_hero_stats do
        primary_key :id
        String      :first_hero
        String      :second_hero
        Float       :coop_index
        Float       :win_rate
        Integer     :match_count
      end


    end
  end
end
