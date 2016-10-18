require "./vehicle"
module Fleet
  class Plane < Vehicle
    include Cargoable
    include Flyable
    def number_of_wheels
      6
    end

    def number_of_engines
      2
    end

    def number_of_gears
      1
    end

    def number_of_wings
      2
    end

    def self.fire_the_missiles

    end
  end
end
