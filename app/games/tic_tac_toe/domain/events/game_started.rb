module TicTacToe
  module Domain
    module Events
      class GameStarted
        attr_accessor :game_id, :time, :turn_for
      end
    end
  end
end
