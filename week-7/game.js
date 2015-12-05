 // Design Basic Game Solo Challenge

// This is a solo challenge

// Your mission description: 
// Overall mission: Eliminate as many checkers pieces from the board as possible, in as few moves as possible.
// Goals: Play as red and take black pieces, play as black and take red pieces.
// Characters: 12 pieces of red, 12 pieces of black (portrayed as X's and O's initially.)
// Objects: Board (8 by 8 grid), 12 red pieces, 12 black pieces.
// Functions: Select piece (based on position), move piece (diagonally, towards the opposite side):
//            If the selected destination square is empty, the piece moves into it. 
//            If it contains an enemy piece and the next furthest square is empty, move there and eliminate the enemy piece from board.
//            If a capture occurred, evaluate for possible jumps from the new position. If more than one available, prompt the user.
//            Pieces that reach the opposite end of the board become "kings" and can now move in 4 directions rather than 2.
//    Keep count of turns, and evaluate every turn for game end (no enemy pieces on board, or no legal moves)

// Pseudocode
//   Create a CheckersBoard object
//     Initialize an 8 x 8 grid, containing 24 other objects:
//     12 red pieces and 12 black pieces, each with position and color attributes.
//     Set the turn counter property to 0.
//   Evaluate game completion
//     Check if either the array of red pieces or the array of black pieces is now empty.
//     Go through the piece objects and determine legal moves for them until a legal move is found.
//   Display board
//     Draw 8 x 8 grid, with the current player's pieces listed as 1-12, with a "K" for king'd pieces.
//     Display opposing pieces as just X or K.
//   Have player select a piece by its number.
//   Evaluate possible moves for that piece. redraw the board with possible moves displayed on it as A/B/C/D.
//   Have player select their move. (If they choose not to, or if there are no possible moves for the piece, go back to piece selection.)
//   Move the piece. Change piece position, evaluate for king'ing, resolve any captures. 
//     If capture occurred, check whether other captures are possible. If there is one, move piece and repeat. 
//     If there are multiple, prompt the user to select from the options (by displaying the board).


// Initial Code
//Create a blank board array
function blankBoard() {
  var display = [];
  var evenRow = ["   ","___","   ","___","   ","___","   ","___"];
  var oddRow = ["___","   ","___","   ","___","   ","___","   "];
  for (var row=0; row<8; row++) {
    if (row % 2 == 0) {display[row] = evenRow.slice(0);}
    else {display[row] = oddRow.slice(0);}
    };
  return display;
}
function addToDisplay(display,moves){
  var label="A"
  for (var move in moves){
    display[moves[move][0]][moves[move][1]]=pad(label);
    label = nextChar(label);
  }
  return display;
}
function pad(label){
  return ("  "+label).slice(-3)
}
function nextChar(c) {
  return String.fromCharCode(c.charCodeAt(0) + 1);
}
function letterToNumber(c) {
  return (c.charCodeAt(0) - "A".charCodeAt(0))
}
function guiBoard(display){
  for (var row in display){
    console.log("---------------------------------")
    console.log("|"+display[row].join("|")+"|")
  }
}
var CheckersBoard = {
  pieces: [],
  //returns array of board's current state
  compileBoard: function(redTurn) {
    var display = blankBoard();
    for (var index in this.pieces) {
      var piece = this.pieces[index]
      var row = piece.row;
      var col = piece.col;
      var displayVal = piece.display;
      if (piece.red != redTurn) {displayVal = pad("X")}
      display[row][col]=pad(displayVal);
    }
    return display;
  },
  //create pieces and assign them initial positions
  createPieces: function() {
    var startingRow = [0,0,0,0,1,1,1,1,2,2,2,2,5,5,5,5,6,6,6,6,7,7,7,7]
    var startingCol = [1,3,5,7,0,2,4,6,1,3,5,7,0,2,4,6,1,3,5,7,0,2,4,6]
    for (var i=0;i<=23;i++) {
      var piece = {
        row: startingRow.pop(),
        col: startingCol.pop(),
        display: (i%12)+1,
        red: (i<12),
      }
      this.pieces.push(piece)
    }
  },
  //Helper functions
  //Find piece by display ID
  pieceID: function (id,redTurn){
    var piece = {}
    for (var index in this.pieces) {
      if (this.pieces[index].display == id && this.pieces[index].red == redTurn) {piece = this.pieces[index];}
    }
    return piece;
  },
  //Find piece by location
  pieceAt: function (row,col) {
    var piece = {}
    for (var index in this.pieces) {
      if (this.pieces[index].row == row && this.pieces[index].col == col) {piece = this.pieces[index];}
    }
    return piece;
  },
  indexAt: function (row,col) {
    for (var index in this.pieces) {
      if (this.pieces[index].row == row && this.pieces[index].col == col) {return index;}
    }
  },
  
  //Return possible moves for selected piece
  calcMoves: function(piece,redTurn) {  
    var options = []
    //Find move A (forward-left)--"forward" is relative
    var rowA = 0;
    var colA = piece.col-1;
    if (redTurn) {rowA = piece.row-1}
    else {rowA = piece.row+1};
    if (this.testMove(piece,rowA,colA)) {
    options.push([rowA,colA])
    }
    //Find move B (forward-right)
    var rowB = 0;
    var colB = piece.col+1;
    if (redTurn) {rowB = piece.row-1}
    else {rowB = piece.row+1}
    if (this.testMove(piece,rowB,colB)) {
    options.push([rowB,colB])
    }
    //Add king'd behavior later
    return options;
  },
  testMove: function(piece, row, col) {
    var valid = true;
    if (row>7 || row<0 || col>7 || col<0) {return false;}
    //move is in bounds, check if there is a piece in the way
    var capPiece = this.pieceAt(row,col);
    if (capPiece.red == undefined) {return true;}
    else if (capPiece.red == piece.red) {return false;}
    //if the piece in the target space is opposite color,
    //check the space beyond it
    else {return true;}
    //Implement jumping lateer
    
  },
  movePiece: function (piece, move) {
    //If there is a piece in the target space, get rid of it
    var capPiece = this.indexAt(move[0],move[1])
    if (capPiece != undefined) {
      delete this.pieces[capPiece];
    }
    //Then move current piece into that space
    piece.row = move[0]
    piece.col = move[1]
  }
}

//*** Driver code ***
// Initialize the board, create pieces
var board = CheckersBoard;
board.createPieces();
// Display the board, start with red's turn
var redTurn = true;
var gameOver = false
//For each turn...
while (gameOver == false){
  //Add later: Check if game is over yet
  gameOver = false
  //Compile and display current board state
  var display=board.compileBoard(redTurn)
  guiBoard(display)
  //Have user select a piece
  var selectPiece = prompt("Select a piece to move(1-12):")
  //Calculate legal moves and overlay them on board
  var piece = board.pieceID(selectPiece,redTurn)
  var moves=board.calcMoves(piece,redTurn)
  display = addToDisplay(display,moves)
  guiBoard(display)
  //Have user select their move
  var selectMove = prompt("Select a move to make by letter:")
  //Perform the move
  board.movePiece(piece,moves[letterToNumber(selectMove)])
  //Switch colors
  redTurn = !redTurn;
}

// Refactored Code
//Create a blank board array
function blankBoard() {
  var display = new Array(8)
  var evenRow = ["   ","___","   ","___","   ","___","   ","___"];
  var oddRow = ["___","   ","___","   ","___","   ","___","   "];
  for (var row=0; row<8; row++) {
    if (row % 2 == 0) {display[row] = evenRow.slice(0);}
    else {display[row] = oddRow.slice(0);}
  };
  return display;
}
function addToDisplay(display,moves){
  moves.forEach(function(move){
    display[move.row][move.col]=pad(move.label);
  })
  return display;
}
function pad(label){
  return ("  "+label).slice(-3)
}
function nextChar(c) {
  return String.fromCharCode(c.charCodeAt(0) + 1);
}
function letterToNumber(c) {
  return (c.charCodeAt(0) - "A".charCodeAt(0))
}
function guiBoard(display){
  console.clear()
  display.forEach(function(row){
    console.log("---------------------------------")
    console.log("|"+row.join("|")+"|")
  })
}
function outOfBounds(row,col){
  return !(row>=0 && row<=7 && col>=0 && col<=7)
}
var CheckersBoard = {
  pieces: new Array(24),
  //returns array of board's current state
  compileBoard: function(redTurn) {
    var display = blankBoard();
    this.pieces.forEach(function(piece){
      var displayVal = piece.display;
      if (piece.red != redTurn) {displayVal = "X"}
      display[piece.row][piece.col]=pad(displayVal);
    })
    return display;
  },
  //create pieces and assign them initial positions
  createPieces: function() {
    this.grid = new Array(8)
    for (var i=0; i<8; i++){this.grid[i]=new Array(8)}
    var startingRow = [7,7,7,7,6,6,6,6,5,5,5,5,2,2,2,2,1,1,1,1,0,0,0,0]
    var startingCol = [0,2,4,6,1,3,5,7,0,2,4,6,1,3,5,7,0,2,4,6,1,3,5,7]
    for (var i=0;i<=23;i++) {
      var piece = {
        row: startingRow[i],
        col: startingCol[i],
        display: (i%12)+1,
        red: (i<12),
      }
      this.pieces[i]=piece
      this.grid[piece.row][piece.col]=piece
    }
  },
  //Helper functions
  //Find piece by display ID
  pieceID: function (id,redTurn){
    return this.pieces.find(function(piece){
      return ((piece.display == id) && (piece.red == redTurn)) 
    })
  },
  
  //Return possible moves for selected piece
  calcMoves: function(piece) {  
    var moves=[],row,label="A"
    //Moves are diagnonal-forward (relative to color)
    if (piece.red) {row = piece.row-1}
    else {row = piece.row+1};
    for (var col=piece.col-1; col<piece.col+2; col+=2){
      var move = {
        row: row,
        col: col, 
      }
      if (this.testMove(piece, move)) {
        move.label=label
        label=nextChar(label)
        moves.push(move)
      }
    }
    //Add king'd behavior later
    return moves;
  },
    
  testMove: function(piece, move) {
    if (outOfBounds(move.row,move.col)) {return false;}
    //move is in bounds, check if there is a piece in the way
    var capPiece = this.grid[move.row][move.col];
    if (capPiece == undefined) {return true;}
    if (capPiece.red == piece.red) {return false;}
    //try to jump a spot further and capture enemy piece
    move.row += (move.row-piece.row)
    move.col += (move.col-piece.col)
    if (outOfBounds(move.row,move.col)) {return false;}
    if (this.grid[move.row][move.col]!=undefined) {return false;}
    move.capPiece = capPiece;
    return true;
  },
  movePiece: function (piece, move) {
    //If the move was a capture, get rid of enemy piece
    var capPiece = move.capPiece
    if (capPiece != undefined) {
      delete this.grid[capPiece.row][capPiece.col]
      delete this.pieces[this.pieces.indexOf(capPiece)];
    }
    //Then move current piece into target space
    delete this.grid[piece.row][piece.col]
    piece.row = move.row
    piece.col = move.col
    this.grid[piece.row][piece.col]=piece
    //Add feature: evaluate piece for king'ing
  }
}

//*** Driver code ***
// Initialize the board, create pieces
var board = CheckersBoard;
board.createPieces();
// Display the board, start with red's turn
var redTurn = true;
var gameOver = false
//For each turn...
while (gameOver == false){
  //To do: Check if game is over yet
  gameOver = false
  //Compile and display current board state
  var display=board.compileBoard(redTurn)
  guiBoard(display)
  //Have user select a piece
  var selectPiece = prompt("Select a piece to move(1-12):")
  //To do: handle invalid choices
  //Calculate legal moves and overlay them on board
  var piece = board.pieceID(selectPiece,redTurn)
  var moves=board.calcMoves(piece)
  display = addToDisplay(display,moves)
  guiBoard(display)
  //Have user select their move
  var selectMove = prompt("Select a move to make by letter:")
  //To do: handle invalid choices
  board.movePiece(piece,moves[letterToNumber(selectMove)])
  redTurn = !redTurn;
}

// Reflection
/*
What was the most difficult part of this challenge?
Since I'm still getting a handle on JavaScript syntax, I had a lot of bugs to track down, and JavaScript doesn't help you much with that. So it involved a lot of inserting console.log statements, and moving them around to see where the code flow was differing from what I expected.

What did you learn about creating objects and functions that interact with one another?
My board object has an array to hold the pieces that are on it. The pieces are also objects. But I didn't give all 24 pieces individual names, so it was surprisingly challenging to address the right one sometimes.

Did you learn about any new built-in methods you could use in your refactored solution? If so, what were they and how do they work?
console.clear clears your console. 
.indexOf returns the index number of an array entry with a value that matches the passed in argument.
.forEach iterates through an array and executes a function for every entry.
.find returns the array entry for which a function returns true.

How can you access and manipulate properties of objects?
When creating them, I often used the colon notation. But I also found it convenient to update them using the dot notation. I didn't need to use the bracket notation, though I can see how that would be another valid approach, for instance if I'd made the pieces properties directly under the board.