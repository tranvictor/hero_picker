collection :hero_vs_hero_stats do
  entity        HeroPicker::HeroVsHeroStat
  repository    HeroPicker::HeroVsHeroRepository

  attribute :id,          Integer
  attribute :first_hero,  String
  attribute :second_hero, String
  attribute :anti_index,  Float
  attribute :win_rate,    Float
  attribute :match_count, Integer
end

collection :hero_coop_hero_stats do
  entity        HeroPicker::HeroCoopHeroStat
  repository    HeroPicker::HeroCoopHeroRepository

  attribute :id,          Integer
  attribute :first_hero,  String
  attribute :second_hero, String
  attribute :coop_index,  Float
  attribute :win_rate,    Float
  attribute :match_count, Integer
end

collection :heroes do
  entity        HeroPicker::Hero
  repository    HeroPicker::HeroRepository

  attribute :id,          Integer
  attribute :name,        String
  attribute :dotamax_id,  String
  attribute :image,       String
end
