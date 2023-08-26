module ViewData
  module Handlers
    module TicTacToe
      class GameStarted
        def self.call(game_started)
          ReadModels::TicTacToe::Game.create(
            id: game_started.game_id,
            turn_for: game_started.turn_for,
            started_at: game_started.time
          )
        end
      end
    end
  end
end
