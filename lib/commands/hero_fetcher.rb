require_relative './fetcher'
require 'nokogiri'

module HeroPicker
  module Command
    class HeroFetcher < Fetcher

      def run
        doc = Nokogiri::HTML(fetched_data)
        doc.css('.hero-list-hero').each do |hero_div|
          attributes = extract_attributes(hero_div)
          p attributes
          HeroRepository.persist(Hero.new(attributes))
        end
      end

      def self.run
        new("http://dotamax.com/hero/").run
      end

      private
      def extract_attributes(div)
        {}.tap do |result|
          result['dotamax_id'] = div.attributes['onclick'].value.split('/')[-2]
          result['name'] = div.css('.hero-list-bar > span').text
          result['image'] = div.css('img.hero-hover')[0].attributes['src'].value
        end
      end
    end
  end
end
