class CreateInternships < ActiveRecord::Migration[6.0]
  def change
    create_table :internships do |t|
      t.string :occupation
      t.string :institution
      t.string :city
      t.string :state
      t.text :description
      t.text :benefits
      t.float :remuneration
      t.references :professor

      t.timestamps
    end
  end
end
