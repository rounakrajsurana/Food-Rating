FactoryBot.define do
  factory :Aadmin1, class: User do
    id { "501" }
    email { "admin@ait.asia" }
    password { 'password' }
    password_confirmation { 'password' }
    fullname { 'Name Admin' }
    contactno { '1234567890' }
    admin { "true" }
    stall { "false" }
    active { "true" }
  end

  factory :Astall1, class: User do
    id { "502" }
    email { 'stall@ait.asia' }
    password { 'password' }
    password_confirmation { 'password' }
    fullname { 'Name Stall' }
    contactno { '1234567890' }
    admin { false }
    stall { true }
    active { true }
  end

  factory :Amember1, class: User do
    id { "503" }
    email { 'member@ait.asia' }
    password { 'password' }
    password_confirmation { 'password' }
    fullname { 'Name Member' }
    contactno { '1234567890' }
    admin { false }
    stall { false }
    active { true }
  end

  factory :category, class: Category do
    id { "111" }
    name { 'A category name' }
    desc { 'A short description' }
    user_id { '501' }
  end

  factory :stall, class: Stall do
    id { "222" }
    name { 'A stall name' }
    desc { 'A small description is enough' }
    picture { 'stall.png' }
    latlog { '(45,45)' }
    owner { '502' }
    user_id { '501' }
  end

  factory :dish, class: Dish do
    id { "333" }
    name { 'A dish name' }
    desc { 'A very huge description is not required just basic ones are enough' }
    picture { 'dish.png' }
    category_id { '111' }
    stall_id { '222' }
    user_id { '502' }
  end

  # factory :rating, class: Ratings do
  #   id { "444" }
  #   rate { 5 }
  #   comment { 'A Great dish!' }
  #   dish_id { '333' }
  #   user_id { '503' }
  # end

end
