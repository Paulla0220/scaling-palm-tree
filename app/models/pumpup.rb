class Pumpup < ApplicationRecord
  belongs_to :user

  validates :series, presence: { message: "musisz podać wartość dla serii" }, inclusion: { in: 1..500, message: "wartość serii poza zakresem - od 1 do 500" }, numericality: { only_integer: true, message: "seria musi być liczbą całkowitą" }
  validates :rep, presence: { message: "musisz podać wartość dla powtórzeń" }, inclusion: { in: 1..1000, message: "wartość powtórzeń poza zakresem - od 1 do 1000" }, numericality: { only_integer: true, message: "powtórzenia muszą być liczbą całkowitą" }
  validates :date, presence: { message: "musisz podać wartość dla daty" }, uniqueness: { scope: :user_id, message: "wartość musi być unikalna dla daty" }
  validate :check_date

  private

  def check_date
    if date.present? && date > Date.current
      errors.add(:date, "data musi być z poprzednich dni lub dzisiejszego dnia")
    end
  end
end
