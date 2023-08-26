module ViewData
  module Handlers
    module TicTacToe
      class GameFinished
        def self.call(game_finished)
          read_model = ReadModels::TicTacToe::Game.find(game_finished.game_id)
          read_model.update(
            winner: game_finished.winner,
            finished_at: game_finished.time
          )
        end
      end
    end
  end
end
