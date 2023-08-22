module EventStore
  HANDLERS = {
    TicTacToe::Domain::Events::GameStarted => [ViewData::Handlers::TicTacToe::GameStarted],
    TicTacToe::Domain::Events::MarkPlaced => [ViewData::Handlers::TicTacToe::MarkPlaced],
    TicTacToe::Domain::Events::GameFinished => [ViewData::Handlers::TicTacToe::GameFinished]
  }.freeze

  class Write
    def call(event)
      handlers = HANDLERS[event.class]
      return unless handlers

      handlers.each do |handler_class_name|
        handler_class_name.call(event)
      end
    end
  end
end
