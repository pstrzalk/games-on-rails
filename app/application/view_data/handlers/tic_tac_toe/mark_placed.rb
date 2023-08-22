module ViewData
  module Handlers
    module TicTacToe
      class MarkPlaced
        def self.call(mark_placed)
          board_attribute = "board#{mark_placed.row}#{mark_placed.col}"

          ReadModels::TicTacToe::Game.save_record(
            mark_placed.game_id,
            board_attribute => mark_placed.mark
          )
        end
      end
    end
  end
end
