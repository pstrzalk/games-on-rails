module ViewData
  module ReadModels
    module TicTacToe
      class Game < ApplicationRecord
        extend ReadModel

        broadcasts_to ->(game) { "tic_tac_toe_game_#{game.id}" }

        def self.table_name
          'tic_tac_toe_read_model_games'
        end
      end
    end
  end
end
