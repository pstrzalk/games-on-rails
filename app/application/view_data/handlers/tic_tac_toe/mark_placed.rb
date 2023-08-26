module ViewData
  module Handlers
    module TicTacToe
      class MarkPlaced
        def self.call(mark_placed)
          board_attribute = "board#{mark_placed.row}#{mark_placed.col}"

          read_model = ReadModels::TicTacToe::Game.find(mark_placed.game_id)
          read_model.update(
            board_attribute => mark_placed.mark,
            turn_for: mark_placed.turn_for
          )
        end
      end
    end
  end
end
