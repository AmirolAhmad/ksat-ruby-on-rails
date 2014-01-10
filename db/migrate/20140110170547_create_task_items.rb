class CreateTaskItems < ActiveRecord::Migration
  def change
    create_table :task_items do |t|
      t.references :ksat_list, index: true
      t.string :content

      t.timestamps
    end
  end
end
