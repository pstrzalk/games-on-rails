require 'test_helper'

module TicTacToe
  module Application
    class StartGameServiceTest < ActiveSupport::TestCase
      test 'start a game' do
        game_id = SecureRandom.uuid
        IdentityGenerator.next = game_id

        StartGameService.call

        assert Domain::GameRepository.get.of_id(game_id)
      end
    end
  end
end
