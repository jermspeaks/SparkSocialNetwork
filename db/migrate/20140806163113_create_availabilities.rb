class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :text
      t.belongs_to :user

      t.timestamps
    end
  end
end
