class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :idEmployee
      t.string :fullname
      t.string :occupation
      t.string :idBoss

      t.timestamps
    end
  end
end
