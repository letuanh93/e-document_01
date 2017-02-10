FactoryGirl.define do
  factory :download do
    user_id{User.select("id").sample().id}
    document_id{Document.select("id").sample().id}
  end
end
