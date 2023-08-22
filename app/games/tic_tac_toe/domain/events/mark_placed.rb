module TicTacToe
  module Domain
    module Events
      class MarkPlaced
        attr_accessor :game_id, :row, :col, :mark, :time
      end
    end
  end
end
