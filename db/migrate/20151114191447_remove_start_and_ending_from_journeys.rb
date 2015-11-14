class RemoveStartAndEndingFromJourneys < ActiveRecord::Migration
  def change
    remove_column :journeys, :start, :date
    remove_column :journeys, :ending, :date
  end
end
