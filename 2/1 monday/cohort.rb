class Cohort
  attr_reader :subject
  def initialize(subject)
    @subject = subject     # => "ROOOOOOBY"
  end                      # => :initialize

  def graduate!
    "Yay Demo day"  # => "Yay Demo day"
  end               # => :graduate!

  private def work!
    "Doing work son!"
  end                  # => Cohort
end                    # => Cohort
