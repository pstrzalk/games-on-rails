module ViewData
  module Handlers
    module TicTacToe
      class GameFinished
        def self.call(game_finished)
          ReadModels::TicTacToe::Game.save_record(
            game_finished.game_id,
            winner: game_finished.winner,
            finished_at: game_finished.time
          )
        end
      end
    end
  end
end
