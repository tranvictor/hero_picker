module Web::Controllers::Home
  class Index
    include Web::Action
    expose :heroes

    def call(params)
      @heroes = ::HeroPicker::HeroRepository.all_heroes
    end
  end
end
