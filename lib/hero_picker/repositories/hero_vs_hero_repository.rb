require_relative './stat_persisting'

module HeroPicker
  class HeroVsHeroRepository
    include Lotus::Repository
    include StatPersisting

  end
end
