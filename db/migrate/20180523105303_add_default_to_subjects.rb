class AddDefaultToSubjects < ActiveRecord::Migration[5.2]
  def change
    change_column :subjects, :created_at, :datetime, default: -> { 'current_timestamp' }
    change_column :subjects, :updated_at, :datetime, default: -> { 'current_timestamp' }
  end
end
