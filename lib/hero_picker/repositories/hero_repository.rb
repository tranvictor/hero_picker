module HeroPicker
  class HeroRepository
    include Lotus::Repository

    def self.all_heroes
      self.all
    end
  end
end
