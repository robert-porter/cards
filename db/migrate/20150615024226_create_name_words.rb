class CreateNameWords < ActiveRecord::Migration
  def change
    drop_table :name_words

    create_table :name_words do |t|
      t.string :word

      t.timestamps null: false
    end
  end
end
