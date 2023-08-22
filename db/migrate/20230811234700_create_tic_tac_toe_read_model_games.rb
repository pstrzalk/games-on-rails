class CreateTicTacToeReadModelGames < ActiveRecord::Migration[7.0]
  def change
    create_table :tic_tac_toe_read_model_games, id: :uuid do |t|
      t.string :turn_for
      t.string :winner, default: nil

      t.string :board00, default: nil
      t.string :board01, default: nil
      t.string :board02, default: nil
      t.string :board10, default: nil
      t.string :board11, default: nil
      t.string :board12, default: nil
      t.string :board20, default: nil
      t.string :board21, default: nil
      t.string :board22, default: nil

      t.timestamp :started_at
      t.timestamp :finished_at
    end
  end
end
