class Event < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :organizer_name, presence: true
  validates :organizer_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :date, presence: true, message: "Date field cannot be empty."
  validates :date_is_valid

  def date_is_valid
    if date.present? && date < (Date.today)
      errors.add(:date, 'Date cannot be in the past.')
    end
  end

end
