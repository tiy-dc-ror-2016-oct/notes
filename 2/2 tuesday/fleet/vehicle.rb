module Fleet
  class Vehicle
    attr_reader :mph

    def initialize(mph)
      @mph = mph
    end

    def travel_time(distance)
      distance / mph
    end

    def number_of_wheels
      4
    end

    def number_of_engines
      1
    end

    def number_of_gears
      4
    end

    def number_of_wings
      raise NoWingsError
    end
  end

  class HybridCar < Vehicle
    def number_of_engines
      2
    end
  end

  class Motorcycle < Vehicle
    def number_of_wheels
      2
    end
  end

  class Bicycle < Motorcycle
    attr_reader :gears
    def initialize(mph, gears)
      super(mph)
      @gears = gears
    end

    def number_of_engines
      0
    end

    def number_of_gears
      gears
    end
  end

  class NoWingsError < StandardError
  end

  class Truck < Vehicle
    include Cargoable
  end

  class Helicopter < Vehicle
    include Flyable
  end
end
