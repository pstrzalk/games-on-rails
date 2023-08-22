require 'test_helper'

module TicTacToe
  module Application
    class PlaceMarkServiceTest < ActiveSupport::TestCase
      test 'place two marks in a new game' do
        game = Domain::Game.start
        Domain::GameRepository.get.save(game)

        # put x
        PlaceMarkService.call(game.id, 2, 1)

        board = game.send(:board)
        expected_board = [
          [nil, nil, nil],
          [nil, nil, nil],
          [nil, 'x', nil]
        ]
        assert_equal board, expected_board

        # put o
        PlaceMarkService.call(game.id, 1, 1)

        board = game.send(:board)
        expected_board = [
          [nil, nil, nil],
          [nil, 'o', nil],
          [nil, 'x', nil]
        ]

        assert_equal board, expected_board
      end
    end
  end
end
