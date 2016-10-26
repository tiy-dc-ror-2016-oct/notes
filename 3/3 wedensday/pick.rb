class Pick < ActiveRecord::Base
  def student
    Student.find(self.student.id)
  end
end
