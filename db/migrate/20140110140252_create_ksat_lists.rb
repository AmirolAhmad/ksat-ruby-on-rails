class CreateKsatLists < ActiveRecord::Migration
  def change
    create_table :ksat_lists do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
