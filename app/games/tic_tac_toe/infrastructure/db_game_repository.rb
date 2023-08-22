module TicTacToe
  module Infrastructure
    class DbGameRepository
      include WithDomainEvents::Repository

      def initialize(event_store_write: ::EventStore::Write.new)
        @event_store_write = event_store_write
      end

      def of_id(id)
        db_game = DbGame.find_by(id:)
        return unless db_game

        build_domain_object_from_db(db_game)
      end

      def save(game)
        db_game = DbGame.find_by(id: game.id) if game.id
        unless db_game
          id = IdentityGenerator.next
          db_game = DbGame.new(id: id)
        end

        db_game.board = game.send(:board)
        db_game.turn_for = game.send(:turn_for)
        db_game.save!
        game.send('id=', db_game.id)

        commit_events(game, copy_event_id_to: :game_id)
      end

      private

      def build_domain_object_from_db(db_game)
        game = Domain::Game.new
        game.send('id=', db_game.id)
        game.send('board=', db_game.board)
        game.send('turn_for=', db_game.turn_for)

        game
      end
    end
  end
end
