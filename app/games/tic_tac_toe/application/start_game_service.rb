module TicTacToe
  module Application
    class StartGameService
      def self.call
        game = Domain::Game.start

        repository = Domain::GameRepository.get
        repository.save(game)

        game.id
      end
    end
  end
end
