require 'nokogiri'

module HeroPicker
  module Command
    module StatExtractor
      def run
        puts "Fetching stats for #{@hero.name}"
        doc = Nokogiri::HTML(fetched_data)
        doc.css('table.table-list tr').tap do |i|
          i.shift
        end.each do |hero_tr|
          attributes = extract_attributes(hero_tr)
          attributes[:first_hero] = @hero.dotamax_id
          attributes[stat_field] = attributes.delete :index
          repository.persist(entity.new(attributes))
        end
      end

      def extract_attributes(div)
        {}.tap do |result|
          enemy, anti_index, win_rate, matches = div.css('td')
          result[:second_hero] = extract_hero_id(enemy)
          result[:index] = extract_anti_index(anti_index)
          result[:win_rate] = extract_win_rate(win_rate)
          result[:match_count] = extract_matches(matches)
        end
      end

      def extract_hero_id(tr)
        tr.css('a')[0].attributes['href'].value.split('/')[-1]
      end

      def extract_anti_index(tr)
        tr.css('div')[0].text[0..-1].to_f
      end

      def extract_win_rate(tr)
        tr.css('div')[0].text[0..-1].to_f
      end

      def extract_matches(tr)
        tr.css('div')[0].text.to_i
      end
    end
  end
end
