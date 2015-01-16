require_relative './hero_fetcher'
require_relative './hero_coop_hero_stat_fetcher'
require_relative './hero_vs_hero_stat_fetcher'

module HeroPicker
  module Command
    class FullDataFetcher
      def self.run
        HeroFetcher.run
        heroes = HeroRepository.all
        heroes.each do |hero|
          HeroCoopHeroStatFetcher.new(hero).run
          HeroVsHeroStatFetcher.new(hero).run
        end
      end
    end
  end
end
