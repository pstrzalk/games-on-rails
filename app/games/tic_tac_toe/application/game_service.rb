module TicTacToe
  class GameService
    def start
      game = Domain::Game.new

      Domain::GameRepository.save(game)
    end

    def place_mark(game_id, row, col)
      game = Domain::GameRepository.of_id(game_id)
      game.place_mark_at(row, col)

      Domain::GameRepository.save(game)
    end
  end
end
