class Version < ApplicationRecord
  belongs_to :project

  scope :semantic, -> { order(major: :asc, minor: :asc, patch: :asc) }
  scope :stable, -> { all }
  scope :latest, -> { order(Arel.sql('created_at::timestamp(0) desc, major desc, minor desc, patch desc')) }

  def to_s
    [major, minor, patch].compact.join(".")
  end
end
