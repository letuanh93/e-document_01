FactoryGirl.define do
  factory :comment do
    user_id {1}
    document_id {1}
    content {FFaker::Lorem.sentence}
  end
end
