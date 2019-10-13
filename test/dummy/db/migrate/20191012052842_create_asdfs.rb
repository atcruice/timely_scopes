class CreateAsdfs < ActiveRecord::Migration[6.0]
  def change
    create_table :asdfs do |t|
      t.boolean :bool
      t.date :dated_on
      t.datetime :datetimed_at
    end
  end
end
