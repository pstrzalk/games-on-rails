module TicTacToe
  module Infrastructure
    class HashGameRepository
      include WithDomainEvents::Repository

      def initialize(event_store_write: ::EventStore::Write.new)
        @@memory ||= {}
        @event_store_write = event_store_write
      end

      def of_id(id)
        @@memory[id]
      end

      def save(game)
        unless game.id
          id = IdentityGenerator.next
          game.send('id=', id)
        end

        @@memory[game.id] = game
        commit_events(game, copy_event_id_to: :game_id)
      end
    end
  end
end
