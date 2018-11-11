FactoryBot.define do

  factory :admin, class: User do
    id { "1" }
    email { "admin@ait.asia" }
    password { 'password' }
    password_confirmation { 'password' }
    fullname { 'Name Admin' }
    contactno { '1234567890' }
    admin { true }
    stall { false }
  end

  factory :stall, class: User do
    id { "2" }
    email { 'stall@ait.asia' }
    password { 'password' }
    password_confirmation { 'password' }
    fullname { 'Name Stall' }
    contactno { '1234567890' }
    admin { false }
    stall { true }
  end

  factory :member, class: User do
    id { "3" }
    email { 'member@ait.asia' }
    password { 'password' }
    password_confirmation { 'password' }
    fullname { 'Name Member' }
    contactno { '1234567890' }
    admin { false }
    stall { false }
  end

  factory :dish, class: Dish do
    id { "4" }
    name { 'some dish name' }
    desc { 'a very huge description is not required just basic ones are enough' }
    picture { 'vegan1.jpg' }
    category_id { '1' }
    stall_id { '2' }
    user_id { '3' }
  end

  factory :stallname, class: Stall do
    id { "5" }
    name { 'some stall name' }
    desc { 'a small description is enough' }
    picture { 'stall1.jpg' }
    latlog { '45,45' }
    user_id { '3' }
  end

end
