class CreateUsermovies < ActiveRecord::Migration[6.0]
  def change
    create_table :usermovies do |t|
      t.references :user
      t.references :movie

      t.timestamps
    end
  end
end
