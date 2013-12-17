class Spotting < ActiveRecord::Base
  attr_accessible :bird_name, :location, :spotted_by
#
  validates_presence_of :bird_name
  validates_presence_of :location
  validates_presence_of :spotted_by

  class << self
    def incidents(argument)
      where("bird_name LIKE :argument OR location LIKE :argument",
            argument: "%#{argument}%")
    end

    def bird_count(bird_name)
      incidents(bird_name).count
    end

    def location_count(location)
      incidents(location).count
    end
  end
end
