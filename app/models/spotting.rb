class Spotting < ActiveRecord::Base
  attr_accessible :bird_name, :location, :spotted_by
#
  validates_presence_of :bird_name
  validates_presence_of :location
  validates_presence_of :spotted_by

  def self.incidents(argument)
    where("bird_name LIKE :argument OR location LIKE :argument", argument: "%#{argument}%")
  end

  def self.bird_count(bird_name)
    self.incidents(bird_name).count
  end

  def self.location_count(location)
    self.incidents(location).count
  end
end
