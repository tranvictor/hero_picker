require_relative './stat_persisting'

module HeroPicker
  class HeroCoopHeroRepository
    include Lotus::Repository
    include StatPersisting

  end
end
