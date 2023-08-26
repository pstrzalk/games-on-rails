import { Controller } from "@hotwired/stimulus"
// import { FetchRequest } from '@rails/request.js'
// ZROBIC BUTTONY

export default class extends Controller {
  connect() {
    console.log("ttt controller element", this.element);
    // const gameElement = this.element.getElementsByClassName('game')[0];

    // this.gameId = gameElement.dataset.gameId;
    // this.bindCells();
  }

  // bindCells() {
  //   let cellElements = Array.from(this.element.getElementsByClassName('cell'));
  //   cellElements.forEach(cellElement => this.bindCell(cellElement));
  // }

  // bindCell(cellElement) {
  //   cellElement.addEventListener('click', function (event) {
  //     event.preventDefault();

  //     this.placeMark(this.gameId, cellElement.dataset.row, cellElement.dataset.col);
  //   }.bind(this), false);
  // }

  // placeMark(gameId, row, col) {
  //   const path = `/tic_tac_toes/${gameId}/place_mark`;
  //   const query = `row=${row}&col=${col}`;
  //   const url = `${path}?${query}`;

  //   return api({
  //     method: 'put',
  //     url: url,
  //     data: {
  //       row: row,
  //       col, col
  //     },
  //   });
  // }
}
