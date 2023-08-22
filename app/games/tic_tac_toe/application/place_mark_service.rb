module TicTacToe
  module Application
    class PlaceMarkService
      def self.call(game_id, row, col)
        repository = Domain::GameRepository.get

        game = repository.of_id(game_id)
        game.place_mark_at(row, col)

        repository.save(game)
      end
    end
  end
end
