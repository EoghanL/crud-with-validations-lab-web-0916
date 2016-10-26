class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name],
    message: "Artist cannot release two songs of the same name in the same year."}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released
  validate :check_year_validity

  def check_year_validity
    if release_year != nil && release_year > Time.new.year
      errors.add(:release_year, "Cannot release on a future date. dingus")
    end
  end

end
