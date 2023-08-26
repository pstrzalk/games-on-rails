# Games on Rails

Did you know that you can make games with Ruby on Rails?

## Shape of this application

### Domain-Driven Design

The application uses Domain-Driven Design approach, by encapsulating separate bounded contexts in modules. Each game is implemented as a separate module in `app/games` folder.

Each game has its own persistence definition as well as (some sort of) application and domain layers.

### Read Models

For presentation purposes, domain concepts are projected into read models, defined in `app/application/view_data/read_models`. It is done by processing domain events emitted within bounded contexts.

### Hotwire

Frontend uses as little explicit JavaScript as possible. For that purpose, Hotwire is leveraged.

## Games

The games implemented so far:
- Tic Tac Toe
