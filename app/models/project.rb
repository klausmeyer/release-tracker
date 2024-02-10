class Project < ApplicationRecord
  has_many :versions, dependent: :destroy
  belongs_to :version_pattern

  scope :active, -> { all }
  scope :alphabetical, -> { order(name: :asc) }
  scope :popular, -> { alphabetical }

  def latest_version
    versions.stable.semantic.last
  end

  def link
    "https://github.com/#{slug}"
  end

  def version_pattern_regexp
    Regexp.new(version_pattern.regexp)
  end
end
