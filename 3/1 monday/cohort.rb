class Cohort
  attr_reader :students
  LAST_PICKED_PATH = "./last_student.txt"
  def initialize(students = [])
    @students = students
    @last_picked_student = nil
    @students_to_pick_from = []
    reset_students_to_pick_from
  end

  def add_student(student)
    @students << student
  end

  def last_picked_student
    name = File.read(LAST_PICKED_PATH)
    @last_picked_student = Student.new(name)
  end

  def last_picked_student=(student)
    File.write(LAST_PICKED_PATH, student.name)
    @last_picked_student = student
  end

  def students_to_pick_from
    @students_to_pick_from
  end

  def students_to_pick_from=(students)
    @students_to_pick_from = students
  end

  def fairly_pick_a_student!
    reset_students_to_pick_from

    begin
      new_pick = students_to_pick_from.shuffle!.first
    end while new_pick == last_picked_student

    self.last_picked_student = students_to_pick_from.shift
  end

  private def reset_students_to_pick_from
    self.students_to_pick_from = @students.dup if students_to_pick_from.empty?
  end
end
