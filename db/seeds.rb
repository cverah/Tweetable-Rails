# frozen_string_literal: true

User.destroy_all
Tweet.destroy_all
Like.destroy_all
ApiUser.destroy_all
puts 'Create Users'
tanus = User.new(email: 'tanus@gmail.com', username: '@tanus', name: 'the great tanus', password: '123456')
tanus.avatar.attach(io: File.open('db/img/tanus.jpeg'), filename: 'tanus-avatar')
tanus.save

son_goku = User.new(email: 'son_goku@gmail.com', username: '@son_goku', name: 'DZ son_goku', password: '123456')
son_goku.avatar.attach(io: File.open('db/img/son-goku.jpeg'), filename: 'son-goku-avatar')
son_goku.save

dog_fire = User.new(email: 'dog_fire@gmail.com', username: '@dog_fire', name: 'dog_fire', password: '123456')
dog_fire.avatar.attach(io: File.open('db/img/dog-fire.png'), filename: 'dog-fire-avatar')
dog_fire.save

dr_real = User.new(email: 'dr_real@gmail.com', username: '@dr_real', name: 'dr_real', password: '123456')
dr_real.avatar.attach(io: File.open('db/img/dr-real.png'), filename: 'dr-real-avatar')
dr_real.save

cmvh = User.new(email: 'cverah@gmail.com', username: '@cmvh', name: 'Cristhian Vera', password: 'admin123',
                role: 'admin')
cmvh.avatar.attach(io: File.open('db/img/cmvh.png'), filename: 'cmvh-avatar')
cmvh.save

cmvh = User.new(email: 'admin@mail.com', username: '@admin', name: 'admin', password: 'supersecret', role: 'admin')
cmvh.save

puts 'Finis users created'

puts 'Create tweets'
tweet_tanos = Tweet.new(
  body: 'This universe is finite, its resources, finite… if life is left unchecked, life will cease to exist.', user: tanus
)
tweet_tanos.save

tweet_goku = Tweet.new(body: 'I would rather be a brainless monkey than a heartless monster.', user: son_goku)
tweet_goku.save

tweet_dr_real = Tweet.new(body: 'I would rather be a brainless monkey than a heartless monster.', user: dr_real)
tweet_dr_real.save

tweet_dog_fire = Tweet.new(body: 'This is fine, everything is fine.', user: dog_fire)
tweet_dog_fire.save

tweet_dog_fire2 = Tweet.new(body: 'This is fine, everything is fine to THANUS.', user: dog_fire)
tweet_dog_fire2.save

# agregando tweets a tanos
tweet_tanos.retweets << tweet_goku
tweet_tanos.retweets << tweet_dog_fire2

puts 'Finish tweets created'

puts 'Create likes'

like_tanus = Like.new(user: tanus, tweet: tweet_goku)
like_tanus.save
like_songoku = Like.new(user: son_goku, tweet: tweet_tanos)
like_songoku.save
like_dogfire = Like.create(user: dog_fire, tweet: tweet_goku)
like_dogfire.save

puts 'Finish likes created'

# apis
puts 'create API user'
ApiUser.create(email: 'admin@mail.com', username: '@dog_fire', name: 'dog_fire', password: 'supersecret')

puts 'finish created API user'
