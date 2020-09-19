class CreateGatyas < ActiveRecord::Migration[5.2]
  def change
    create_table :gatyas do |t|
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
