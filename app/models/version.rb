class Version < ApplicationRecord
  belongs_to :project

  scope :semantic, -> { order(major: :asc, minor: :asc, patch: :asc) }
  scope :stable, -> { all }

  def to_s
    [major, minor, patch].compact.join(".")
  end
end
