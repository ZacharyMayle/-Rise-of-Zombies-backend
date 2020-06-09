class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :original_title
      t.string :release_date
      t.float :vote_average
      t.integer :vote_count
      t.string :poster
      t.string :overview

      t.references :usermovies, foreign_key: true
      t.timestamps
    end
  end
end
