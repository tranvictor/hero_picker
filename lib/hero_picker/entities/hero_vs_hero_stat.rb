require_relative './stat'

module HeroPicker
  class HeroVsHeroStat < Stat
    attributes :anti_index

    def self.data
      @data ||= {}
    end

    def self.init
    end
  end
end
