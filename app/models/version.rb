class Version < ApplicationRecord
  belongs_to :project

  scope :semantic, -> { order(major: :asc, minor: :asc, patch: :asc) }
  scope :stable, -> { all }
  scope :latest, -> { where.not(released_at: nil).order(released_at: :desc) }

  def to_s
    [major, minor, patch].compact.join(".")
  end
end
