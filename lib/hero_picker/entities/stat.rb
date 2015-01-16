module HeroPicker
  class Stat
    include Lotus::Entity
    attributes :first_hero, :second_hero, :win_rate, :match_count
  end
end
