FactoryBot.define do

  factory :admin, class: User do
    email "admin@ait.asia"
    password 'password'
    password_confirmation 'password'
    fullname 'Name Admin'
    contactno '1234567890'
    admin true
    stall false
  end

  factory :stall, class: User do
    email 'stall@ait.asia'
    password 'password'
    password_confirmation 'password'
    fullname 'Name Stall'
    contactno '1234567890'
    admin false
    stall true
  end

  factory :member, class: User do
    email 'member@ait.asia'
    password 'password'
    password_confirmation 'password'
    fullname 'Name Member'
    contactno '1234567890'
    admin false
    stall false
  end

end
