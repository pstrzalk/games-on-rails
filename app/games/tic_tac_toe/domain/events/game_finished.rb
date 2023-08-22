module TicTacToe
  module Domain
    module Events
      class GameFinished
        attr_accessor :game_id, :time, :winner
      end
    end
  end
end
