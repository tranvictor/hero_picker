require_relative './fetcher'
require_relative './stat_extractor'

module HeroPicker
  module Command
    class HeroVsHeroStatFetcher < Fetcher
      include StatExtractor

      def initialize(hero)
        @hero = hero
        super("http://dotamax.com/hero/detail/match_up_anti/#{hero.dotamax_id}")
      end

      def stat_field
        :anti_index
      end

      def repository
        HeroVsHeroRepository
      end

      def entity
        HeroVsHeroStat
      end

    end
  end
end
