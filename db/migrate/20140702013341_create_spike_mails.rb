class CreateSpikeMails < ActiveRecord::Migration
  def change
    create_table :spike_mails do |t|

      t.timestamps
    end
  end
end
