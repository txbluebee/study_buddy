class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:users) do |t|
    t.column(:name, :string)
    end

    create_table(:languages) do |t|
    t.column(:name, :string)
    t.column(:user_id, :integer)
    end

    create_table(:tips) do |t|
    t.column(:name, :string)
    t.column(:description, :text)
    t.column(:language_id, :integer)
    end

    create_table(:projects) do |t|
    t.column(:name, :string)
    t.column(:date, :date)
    t.column(:description, :text)
    t.column(:github, :string)
    t.column(:language_id, :integer)
    end

    create_table(:flashcards) do |t|
    t.column(:question, :string)
    t.column(:answer, :string)
    t.column(:tag_id, :integer)
    end

    create_table(:tags) do |t|
    t.column(:name, :string)
    t.column(:language_id, :integer)
    end
  end
end
