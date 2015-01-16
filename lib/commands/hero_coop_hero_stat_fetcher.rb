require_relative './fetcher'
require_relative './stat_extractor'

module HeroPicker
  module Command
    class HeroCoopHeroStatFetcher < Fetcher
      include StatExtractor

      def initialize(hero)
        @hero = hero
        super("http://dotamax.com/hero/detail/match_up_comb/#{hero.dotamax_id}")
      end

      def stat_field
        :coop_index
      end

      def repository
        HeroCoopHeroRepository
      end

      def entity
        HeroCoopHeroStat
      end

    end
  end
end
