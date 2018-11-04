# == Schema Information
#
# Table name: cars
#
#  id             :integer          not null, primary key
#  make           :string           default(""), not null
#  model          :string           default(""), not null
#  color          :string           default(""), not null
#  year           :string           default(""), not null
#  price          :float            default(0.0), not null
#  mileage        :float            default(0.0), not null
#  running        :boolean          default(TRUE)
#  interior_color :string           default(""), not null
#  vin            :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Car < ApplicationRecord
  # Assoications
  # has_many :parts, dependent: :destroy

  # Validations
  validates_presence_of :make, :model, :color, :year, :price, :mileage, :vin, :interior_color
  validates_uniqueness_of :vin
  validates_inclusion_of :year, in: (1920..Date.today.year).to_a

  # Instance Methods
  def paint(color)
    self.update(color: color)
  end

  def info
    "#{self.year}, #{self.make} #{self.model} with #{mileage} miles"
  end

  def honk
    "#{self.info} says: Beep Beep"
  end

  # Class Methods - Scopes

  # Example: Car.all.running
  def self.running(running = true)
    self.where(running: running)
  end

  def self.by_make
    self.order(:make)
  end

  def self.by_price(highest = false)
    highest ? self.order(price: :desc) : self.order(:price)
  end

  # Callbacks
end
