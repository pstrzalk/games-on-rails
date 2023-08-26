class TicTacToesController < ApplicationController
  def start
    game_id = TicTacToe::Application::StartGameService.call

    redirect_to tic_tac_to_path(game_id)
  end

  def show
    @game = ViewData::ReadModels::TicTacToe::Game.find(params[:id])
  end

  def place_mark
    game_id = params[:tic_tac_to_id]
    row = params[:row].to_i
    col = params[:col].to_i

    TicTacToe::Application::PlaceMarkService.call(game_id, row, col)

    redirect_to tic_tac_to_path(game_id)
  end
end
