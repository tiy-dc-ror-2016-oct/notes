require 'pry'

class Bottle

  def initialize(volume = 0.0)
    @open = false
    @volume = volume
  end

  def fill_up(amount)
    if open?
      @volume += amount
    else
      raise "bottle not open"
    end
  end

  def 🍾
    open!
    @volume -= take_a_sip(100)

    p "🎉" * 50 + "🐩"
  end

  def volume
    @volume
  end

  def open?
    @open
  end

  def closed?
    !@open
  end

  def open!
    @open = true
  end

  def close!
    @open = false
  end

  def take_a_sip(sip_size = 20)
    raise "bottle not open" if closed?

    binding.pry

    if volume < sip_size
      @volume = 0
    else
      @volume -= sip_size
    end
  end
end
