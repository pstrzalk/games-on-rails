module TicTacToe
  module Infrastructure
    class GameRepository
      def find(id)
        db_game = DbGame.find_by(id:)
        return unless db_game

        game = Domain::Game.new(id: db_game[:id])
        game.send('board=', db_game.board)
        game.send('turn_for=', db_game.turn_for)

        game
      end

      def save(game)
        db_game = DbGame.find_by(id: game.id) if game.id
        db_game ||= DbGame.new(id: game.id)

        db_game.board = game.send(:board)
        db_game.turn_for = game.send(:turn_for)

        db_game.save!
      end
    end
  end
end
