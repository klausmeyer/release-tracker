FactoryBot.define do
  factory :version_pattern do
    sequence(:name) { |n| "Pattern #{n}" }
    examples { "1.2.3 / v1.2.3 / release-1.2.3" }
    regexp { '^(?:v|release-)?(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)$' }
  end
end
