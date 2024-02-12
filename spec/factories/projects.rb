FactoryBot.define do
  factory :project do
    source { "github" }
    sequence(:slug) { |n| "org/project-#{n}" }
    sequence(:name) { |n| "Project #{n}" }
    version_pattern
  end
end
