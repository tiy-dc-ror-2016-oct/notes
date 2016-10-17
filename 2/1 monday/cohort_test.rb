require "minitest/autorun"
require "minitest/pride"
require "./cohort"

class CohortTest < Minitest::Test
  def test_our_classes_exist
    assert Cohort
  end

  def test_can_be_created
    assert Cohort.new("Rooooby")
  end

  def test_does_graduate_work?
    the_best_cohort = Cohort.new("Rooooby")
    assert_equal "Yay demo day", the_best_cohort.graduate!
  end
end
