require 'test_helper'

module ViewData
  module ReadModels
    module TicTacToe
      class GameTest < ActiveSupport::TestCase
        test 'gets populated with a new game' do
          Clock.utc = '2021-04-12 22:07:13 UTC'

          game = ::TicTacToe::Domain::Game.start
          ::TicTacToe::Domain::GameRepository.get.save(game)

          read_model = Game.find(game.id)
          assert read_model

          assert_equal read_model.turn_for, 'x'
          assert_equal read_model.started_at, '2021-04-12 22:07:13 UTC'
        end

        test 'gets populated after placing a mark' do
          repository = ::TicTacToe::Domain::GameRepository.get

          game = ::TicTacToe::Domain::Game.start
          game.place_mark_at(0, 0)
          game.place_mark_at(1, 1)
          game.place_mark_at(2, 2)
          repository.save(game)

          read_model = Game.find(game.id)

          assert_equal read_model.board00, 'x'
          assert_equal read_model.board11, 'o'
          assert_equal read_model.board22, 'x'
        end

        test 'gets populated when one side wins' do
          repository = ::TicTacToe::Domain::GameRepository.get
          game = ::TicTacToe::Domain::Game.start

          game.place_mark_at(0, 0) # x
          game.place_mark_at(0, 1) # o
          game.place_mark_at(1, 0) # x
          game.place_mark_at(1, 1) # o
          repository.save(game)

          Clock.utc = '2021-04-12 23:07:13 UTC'
          game.place_mark_at(2, 0) # x wins
          repository.save(game)

          read_model = Game.find(game.id)

          assert_equal read_model.winner, 'x'
          assert_equal read_model.finished_at, '2021-04-12 23:07:13 UTC'

        end

        test 'gets populated on draw' do
          repository = ::TicTacToe::Domain::GameRepository.get

          game = ::TicTacToe::Domain::Game.start
          game.place_mark_at(0, 0) # x
          game.place_mark_at(0, 1) # o
          game.place_mark_at(1, 0) # x
          game.place_mark_at(1, 1) # o
          game.place_mark_at(2, 1) # x
          game.place_mark_at(2, 0) # o
          game.place_mark_at(0, 2) # x
          game.place_mark_at(1, 2) # o
          repository.save(game)

          Clock.utc = '2021-04-12 12:07:13 UTC'
          game.place_mark_at(2, 2) # x
          repository.save(game)

          read_model = Game.find(game.id)

          assert_nil read_model.winner
          assert_equal read_model.finished_at, '2021-04-12 12:07:13 UTC'
        end
      end
    end
  end
end
