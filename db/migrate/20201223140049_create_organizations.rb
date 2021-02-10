

class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.integer :categoryId
      t.integer :articleId

      t.timestamps
    end
  end
end
