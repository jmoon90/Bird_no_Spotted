FactoryGirl.define do
  factory :spotting do
    bird_name "Pidgeon"
    location "Moon"
    sequence(:spotted_by) { |n| "Elvis the #{n}" }
  end
end
