require 'minitest/autorun'
require 'minitest/pride'

class AboutControlStatements < Minitest::Test
  def test_if_then_else_statements
    if true
      result = :true_value
    else
      result = :false_value
    end
    assert_equal :true_value, result
  end

  def test_if_then_statements
    result = :default_value
    if true
      result = :true_value
    end
    assert_equal __, result
  end

  def test_if_statements_return_values
    value = if true
              :true_value
            else
              :false_value
            end
    assert_equal __, value

    value = if false
              :true_value
            else
              :false_value
            end
    assert_equal __, value

    # NOTE: Actually, EVERY statement in Ruby will return a value, not
    # just if statements.
  end

  def test_if_statements_with_no_else_with_false_condition_return_value
    value = if false
              :true_value
            end
    assert_equal __, value
  end

  def test_condition_operators
    assert_equal __, (true ? :true_value : :false_value)
    assert_equal __, (false ? :true_value : :false_value)
  end

  def test_if_statement_modifiers
    result = :default_value
    result = :true_value if true

    assert_equal __, result
  end

  def test_unless_statement
    result = :default_value
    unless false    # same as saying 'if !false', which evaluates as 'if true'
      result = :false_value
    end
    assert_equal __, result
  end

  def test_unless_statement_evaluate_true
    result = :default_value
    unless true    # same as saying 'if !true', which evaluates as 'if false'
      result = :true_value
    end
    assert_equal __, result
  end

  def test_unless_statement_modifier
    result = :default_value
    result = :false_value unless false

    assert_equal __, result
  end

  def test_while_statement
    i = 1
    result = 1
    while i <= 10
      result = result * i
      i += 1
    end
    assert_equal 3628800, result
  end

  def test_break_statement
    i = 1
    result = 1
    while true
      break unless i <= 10
      result = result * i
      i += 1
    end
    assert_equal __, result
  end

  def test_break_statement_returns_values
    i = 1
    result = while i <= 10
      break i if i % 2 == 0
      i += 1
    end

    assert_equal __, result
  end

  def test_next_statement
    i = 0
    result = []
    while i < 10
      i += 1
      next if (i % 2) == 0
      result << i
    end
    assert_equal __, result
  end

  def test_for_statement
    array = ["fish", "and", "chips"]
    result = []
    for item in array
      result << item.upcase
    end
    assert_equal [__, __, __], result
  end

  def test_times_statement
    sum = 0
    10.times do
      sum += 1
    end
    assert_equal __, sum
  end

end

############################ Nothing to see below ##############################

# Standard, generic replacement value.
# If value19 is given, it is used in place of value for Ruby 1.9.
def __(value="FILL ME IN", value19=:mu)
    (value19 == :mu) ? value : value19
end

# Numeric replacement value.
def _n_(value=999999, value19=:mu)
    (value19 == :mu) ? value : value19
end

# Error object replacement value.
def ___(value=FillMeInError, value19=:mu)
    (value19 == :mu) ? value : value19
end

# Method name replacement.
class Object
  def ____(method=nil)
    if method
      self.send(method)
    end
  end

  public :method_missing
end
