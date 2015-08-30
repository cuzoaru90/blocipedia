FactoryGirl.define do
    factory :wiki do
      user
      title "Wiki title"
      body "Wiki body"
      boolean false
    end
end