module HeroPicker
  module StatPersisting
    def StatPersisting.included(base)
      base.extend ClassMethod
    end

    module ClassMethod
      def persist(stat)
        if s = by_heroes(stat.first_hero, stat.second_hero)
          stat.id = s.id
          update(stat)
        else
          create(stat)
        end
      end

      def by_heroes(first, second)
        query { where(first_hero: first, second_hero: second).limit(1) }.first
      end
    end
  end
end
