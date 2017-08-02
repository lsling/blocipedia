10.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: 'password',
        password_confirmation: 'password'
    )
end

users = User.all

users.each do |user|
  user.update(confirmed_at: Time.now)
end

30.times do
    Wiki.create!(
        title: Faker::Lorem.unique.sentence,
        body: Faker::Lorem.unique.paragraph,
        private: Faker::Boolean.boolean(true_ratio = 0.5),
        user: users.sample
    )
end

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
 puts "You can login with this sample user. email: #{users.first.email}, password: password"
