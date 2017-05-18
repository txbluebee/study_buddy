class AddResourcesTable < ActiveRecord::Migration[5.1]
  def change
      create_table(:resources) do |t|
      t.column(:name, :string)
      t.column(:link, :string)
    end
  end
end
