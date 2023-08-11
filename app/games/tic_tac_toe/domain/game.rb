module TicTacToe
  module Domain
    class Game
      def initialize
        @board = [
          [nil, nil, nil],
          [nil, nil, nil],
          [nil, nil, nil]
        ]
        @turn_for = 'x'
      end

      def place_mark_at(row, col)
        raise SpotAlreadyPlayed if board[row][col]
        raise GameHasAWinner if winner?

        @board[row][col] = @turn_for

        next_turn
      end

      def winner?
        %w[x o].each do |mark|
          return mark if [@board[0][0], @board[0][1], @board[0][2]] == [mark, mark, mark] ||
                         [@board[1][0], @board[1][1], @board[1][2]] == [mark, mark, mark] ||
                         [@board[2][0], @board[2][1], @board[2][2]] == [mark, mark, mark] ||
                         [@board[0][0], @board[1][0], @board[2][0]] == [mark, mark, mark] ||
                         [@board[0][1], @board[1][1], @board[2][1]] == [mark, mark, mark] ||
                         [@board[0][2], @board[1][2], @board[2][2]] == [mark, mark, mark] ||
                         [@board[0][0], @board[1][1], @board[2][2]] == [mark, mark, mark] ||
                         [@board[0][2], @board[1][1], @board[2][0]] == [mark, mark, mark]
        end

        nil
      end

      private

      def next_turn
        if @turn_for == 'x'
          @turn_for = 'o'
        elsif @turn_for == 'o'
          @turn_for = 'x'
        end
      end
    end
  end
end
