module ViewData
  module ReadModels
    module TicTacToe
      class Game < ApplicationRecord
        extend ReadModel

        def self.table_name
          'tic_tac_toe_read_model_games'
        end
      end
    end
  end
end
