class ChangeRecordsVisitaType < ActiveRecord::Migration
  def change
    change_column :records, :visita, :datetime
  end
end
