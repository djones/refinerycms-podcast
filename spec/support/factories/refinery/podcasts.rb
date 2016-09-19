
FactoryGirl.define do
  factory :podcast, :class => Refinery::Podcasts::Podcast do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

