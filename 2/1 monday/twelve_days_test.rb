require "minitest/autorun"
require "minitest/pride"
require "./twelve_days"

class TwelveDaysTest < Minitest::Test
  i_suck_and_my_tests_are_order_dependent!
  def test_a_verse_1
    assert_output("On the First day of Christmas, my true love sent to me\na Partridge in a Pear Tree.\n") do
      verse(1)
    end
  end

  def test_b_verse_2
    assert_output("On the Second day of Christmas, my true love sent to me\nTwo Turtle Doves\nand a Partridge in a Pear Tree.\n") do
      verse(2)
    end
  end

  def test_c_entire_song
    assert_output(/a Partridge in a Pear Tree.\nOn the Fourth day of Christmas, my true love sent to me\nFour Calling Birds/) do
      entire_song
    end
  end

  def test_d_entire_song_again
    assert_output(/and a Partridge in a Pear Tree.\nOn the Eleventh day of Christmas, my true love sent to me\nEleven Pipers Piping/) do
      entire_song
    end
  end
end
