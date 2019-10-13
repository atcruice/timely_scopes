class CreateQwers < ActiveRecord::Migration[6.0]
  def change
    create_table :qwers do |t|
      t.date :dated_on
      t.datetime :datetimed_at
    end
  end
end
