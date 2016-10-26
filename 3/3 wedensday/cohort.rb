class Cohort < ActiveRecord::Base

  # LAST_PICKED_PATH = "./last_student.txt"

  # def initialize(students = [])
  #   @students = students
  #   @last_picked_student = nil
  #   @students_to_pick_from = []
  #   reset_students_to_pick_from
  # end

  def add_student(student)
    self.id # Cohort ID
    student.cohort_id = self.id
    student.save
  end

  def last_picked_student
    last_pick = Pick.last
    return unless last_pick
    last_pick.student
  end

  def students_to_pick_from
    students
  end

  def students_to_pick_from=(students)
    Pick.where(ids: students.map {|student|})
  end

  def students
    # Use #to_a if you really need all of the array methods like... shuffle
    Student.where(cohort_id: self.id).to_a
  end

  def fairly_pick_a_student!
    # reset_students_to_pick_from

    begin
      new_pick = students_to_pick_from.shuffle!.first
    end while new_pick == last_picked_student

    chosen_student = students_to_pick_from.shift

    Pick.create(picked_at: Time.now, student_id: chosen_student.id)
  end

  # private def reset_students_to_pick_from
  #   @students_to_pick_from ||= []
  #   @students_to_pick_from = students if students_to_pick_from.empty?
  # end
end
