module TicTacToe
  module Domain
    module Events
      class MarkPlaced
        attr_accessor :game_id, :row, :col, :mark, :turn_for, :time
      end
    end
  end
end
