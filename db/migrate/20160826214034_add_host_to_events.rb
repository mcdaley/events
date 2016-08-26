class AddHostToEvents < ActiveRecord::Migration
  def change
    add_column    :events,  :host_id,         :integer
    remove_column :events,  :organization_id
  end
end
