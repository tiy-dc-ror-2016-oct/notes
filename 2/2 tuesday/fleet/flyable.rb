module Fleet
  module Flyable
    def can_fly?
      is_a?(Helicopter) || number_of_wings > 0
    end
  end
end
