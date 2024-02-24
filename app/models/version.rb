class Version < ApplicationRecord
  belongs_to :project

  scope :semantic, -> {
    order(
      :major,
      :minor,
      arel_table.coalesce(arel_table[:patch], 0),
      arel_table.coalesce(arel_table[:pre], 0)
    )
  }
  scope :stable, -> { all }
  scope :latest, -> { where.not(released_at: nil).order(released_at: :desc) }

  def to_s
    [major, minor, patch, pre].compact.join(".")
  end
end
