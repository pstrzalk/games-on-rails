module TicTacToe
  module Domain
    class Game
      include WithDomainEvents::Entity

      attr_reader :id

      def initialize
        self.board = [
          [nil, nil, nil],
          [nil, nil, nil],
          [nil, nil, nil]
        ]
        self.turn_for = 'x'
        self.id = nil
      end

      def self.start
        game = new

        game_started = Events::GameStarted.new
        game_started.turn_for = 'x'
        game_started.time = ::Clock.utc
        game.send(:dispatch_event, game_started)

        game
      end

      def place_mark_at(row, col)
        raise SpotAlreadyPlayed if board[row][col]
        raise GameHasAWinner if any_winner?

        board[row][col] = @turn_for
        next_turn

        current_time = Clock.utc

        mark_placed = Events::MarkPlaced.new
        mark_placed.row = row
        mark_placed.col = col
        mark_placed.mark = board[row][col]
        mark_placed.time = current_time
        dispatch_event(mark_placed)

        if winner?(board[row][col])
          game_finished = Events::GameFinished.new
          game_finished.winner = board[row][col]
          game_finished.time = current_time

          dispatch_event(game_finished)
        elsif draw?
          game_finished = Events::GameFinished.new
          game_finished.winner = nil
          game_finished.time = current_time

          dispatch_event(game_finished)
        end
      end

      private

      attr_accessor :board, :turn_for
      attr_writer :id

      def draw?
        board.all? { |row| row.all?(&:present?) } && !any_winner?
      end

      def winner?(mark)
        [board[0][0], board[0][1], board[0][2]] == [mark, mark, mark] ||
          [board[1][0], board[1][1], board[1][2]] == [mark, mark, mark] ||
          [board[2][0], board[2][1], board[2][2]] == [mark, mark, mark] ||
          [board[0][0], board[1][0], board[2][0]] == [mark, mark, mark] ||
          [board[0][1], board[1][1], board[2][1]] == [mark, mark, mark] ||
          [board[0][2], board[1][2], board[2][2]] == [mark, mark, mark] ||
          [board[0][0], board[1][1], board[2][2]] == [mark, mark, mark] ||
          [board[0][2], board[1][1], board[2][0]] == [mark, mark, mark]
      end

      def any_winner?
        %w[x o].each do |mark|
          won = winner?(mark)

          return mark if won
        end

        nil
      end

      def next_turn
        if turn_for == 'x'
          self.turn_for = 'o'
        elsif turn_for == 'o'
          self.turn_for = 'x'
        end
      end
    end
  end
end
