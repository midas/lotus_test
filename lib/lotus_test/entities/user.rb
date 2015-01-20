class User

  include Lotus::Entity

  attributes :id,
             :age,
             :name,
             :net_worth

  # UserRepository.persist(User.new( name: 'Jason', age: 38, net_worth: Money.new( 2 )))

end
