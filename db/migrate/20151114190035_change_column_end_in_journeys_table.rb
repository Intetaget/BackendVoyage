class ChangeColumnEndInJourneysTable < ActiveRecord::Migration
  def change
    remove_column :journeys, :end, :date
    add_column :journeys, :ending, :date
  end
end
