class Project < ApplicationRecord
  has_many :versions, dependent: :destroy

  scope :active, -> { all }
  scope :alphabetical, -> { order(name: :asc) }

  def latest_version
    versions.stable.semantic.last
  end

  def link
    "https://github.com/#{slug}"
  end

  def version_pattern_regex
    Regexp.new(version_pattern || '^(?:v|release-)?(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)$')
  end
end
