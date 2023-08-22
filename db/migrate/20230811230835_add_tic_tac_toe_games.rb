class AddTicTacToeGames < ActiveRecord::Migration[7.0]
  def change
    create_table :tic_tac_toe_game, id: :uuid do |t|
      t.text :board, array: true
      t.string :turn_for

      t.timestamps
    end
  end
end
