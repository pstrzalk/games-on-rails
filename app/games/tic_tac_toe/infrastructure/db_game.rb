module TicTacToe
  module Infrastructure
    class DbGame < ApplicationRecord
      def self.table_name
        'tic_tac_toe_game'
      end
    end
  end
end
