module HeroPicker
  class HeroRepository
    include Lotus::Repository

    def self.all_heroes
      self.all
    end

    def self.persist(hero)
      if h = by_dotamax_id(hero.dotamax_id)
        hero.id = h.id
        update(hero)
      else
        create(hero)
      end
    end

    private
    def self.by_dotamax_id(id)
      query { where(dotamax_id: id).limit(1) }.first
    end
  end
end
