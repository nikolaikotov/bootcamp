FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
		sequence :email do |n|
    	"person#{n}@example.com"
  	end
    password { "qwerty" }

    factory :admin do 
    	role { :admin }
    	
    end
  end
end