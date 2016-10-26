class Migration < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|
      t.string :name
    end

    create_table :students do |t|
      t.string :name
      t.integer :cohort_id
    end
  end
end
