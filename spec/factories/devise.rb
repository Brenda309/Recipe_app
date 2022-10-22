FactoryBot.define do
  factory :user do
    name { 'Someone' }
    email { 'test@user.com' }
    password { 'qwerty' }
    # Add additional fields as required via your User model
  end

  # Not used in this tutorial, but left to show an example of different user types
  # factory :admin do
  #   name { 'Someone else' }
  #   email { 'test@admin.com' }
  #   password { 'qwerty' }
  #   role { 'admin' }
  # end
end
