//
//  main.swift
//  tetrisCommandLine002
//
//  Created by pair on 1/12/17.
//  Copyright © 2017 David Neely All rights reserved.
//

import Foundation

var gameScreen = [[0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0,0]]

let l = [[0,1,0,0,0],
         [0,1,0,0,0],
         [0,1,1,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0]]

let l2 = [[0,0,1,0,0],
          [0,0,1,0,0],
          [0,1,1,0,0],
          [0,0,0,0,0],
          [0,0,0,0,0]]

let i = [[0,1,0,0,0],
         [0,1,0,0,0],
         [0,1,0,0,0],
         [0,1,0,0,0],
         [0,0,0,0,0]]

let t = [[0,0,0,0,0],
         [0,1,1,1,0],
         [0,0,1,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0]]

let s = [[0,1,0,0,0],
         [0,1,1,0,0],
         [0,0,1,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0]]

let z = [[0,0,1,0,0],
         [0,1,1,0,0],
         [0,1,0,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0]]

let o = [[0,1,1,0,0],
         [0,1,1,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0]]

let pieces: [[[Int]]] = [l, l2, i, t, s, z, o]

var time: Int = 0

var score: Int = 0

var level: Int = 1

var lines: Int = 0

var pieceOffset: (Int,Int) = (gameScreen[0].count / 2, 0)

func displayStats() {
    
    print("FULL LINES: " + String(lines))

    print("TIME: " + String(time))
    
    print("LEVEL: " + String(level))
    
    print("SCORE: " + String(score))
}

func getRandomPieceFrom(pieces: [[[Int]]]) -> [[Int]]{
    
    let randomInt: Int = Int(arc4random_uniform(UInt32(pieces.count)))
    
    return pieces[randomInt]
}

var currentPiece: [[Int]] = [[]]

var nextPiece: [[Int]] = [[]]

func displayPiece(inputPiece: [[Int]]) {
    
    for height_index in 0...inputPiece.count - 1 {
        
        for width_index in 0...(inputPiece[0].count - 1) {
            
            if(inputPiece[height_index][width_index] == 0) {
                
                print("  ", terminator:"")
                
            } else {
                
                print("[]", terminator:"")
            }
        }
        
        print() // prints new line character
    }
}

func rotate(inputPiece: [[Int]]) -> [[Int]]{
    
    var returnPiece: [[Int]] = [[]]
    
    let lRotated = [[0,0,1,0,0],
                    [1,1,1,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0]]
    
    let l2Rotated = [[0,1,0,0,0],
                     [0,1,1,1,0],
                     [0,0,0,0,0],
                     [0,0,0,0,0],
                     [0,0,0,0,0]]
    
    let iRotated = [[0,0,0,0,0],
                    [1,1,1,1,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0]]
    
    let tRotated = [[0,0,1,0,0],
                    [0,0,1,1,0],
                    [0,0,1,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0]]
    
    let sRotated = [[0,0,1,1,0],
                    [0,1,1,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0]]
    
    let zRotated = [[1,1,0,0,0],
                    [0,1,1,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0]]
    
    let oRotated = [[0,1,1,0,0],
                    [0,1,1,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0],
                    [0,0,0,0,0]]
    
//    if(inputPiece == l2Rotated) {
//    
//    if(inputPiece == l) {
//        returnPiece = l
//    } else if(inputPiece == l) {
//        returnPiece = l
//    }
    
    return returnPiece
    
} // UNIPLEMENTED

func getvalueAtCoords(x: Int, y: Int, inputArray: [[Int]]) -> Int {
    
    return inputArray[y][x]
}

func setValueAtCoords(x: Int, y: Int, inputArray: [[Int]], inputValue: Int) -> [[Int]] {
    var returnArray: [[Int]] = inputArray
    returnArray[x][y] = inputValue
    return returnArray
}

func printGameScreen() {
    for height_index in 0...gameScreen.count - 1 {
        
        // print sides of game screen
        if(height_index == 0 || height_index < gameScreen.count) {

            print("<!", terminator:"")
        }
        
        for width_index in 0...(gameScreen[0].count - 1) {
            
            if(gameScreen[height_index][width_index] == 0) {

                print(" .", terminator:"")
                
            } else {
                
                print("[]", terminator:"")
            }
        }
        
        // print sides of game screen
        if(height_index == 0 || height_index < gameScreen.count) {
            
            print("!>", terminator:"")
        }
        
        print() // prints new line character
        
        // print sides of game screen
        if(height_index == 19 ) {
            
            print("<!********************!>")
            
            print("  \\/\\/\\/\\/\\/\\/\\/\\/\\/\\/")
        }
    }
}

func showPieceOn(screen: [[Int]], piece: [[Int]]) -> [[Int]] {
    
    var returnScreen = screen
    
    for height_index in 0...l.count - 1 {
        
        for width_index in 0...l[0].count - 1 {
            
            if(getvalueAtCoords(x: width_index, y: height_index, inputArray: piece) == 1) {
                
                if((height_index + pieceOffset.1 < gameScreen.count - 1) &&
                    (width_index + pieceOffset.0 < gameScreen[0].count - 1)) {

                    returnScreen[height_index + pieceOffset.1][width_index + pieceOffset.0] = 1
                        
                }
            }
        }
    }
    
    return returnScreen
}

func addPieceTo(screen: [[Int]]) -> [[Int]]{
    
    var returnScreen = screen
    
    for height_index in 0...l.count - 1 {
        
        for width_index in 0...l[0].count - 1 {
            
            if(getvalueAtCoords(x: width_index, y: height_index, inputArray: currentPiece) == 1) {
                
                returnScreen[height_index + pieceOffset.1][width_index + pieceOffset.0] = 1
            }
        }
    }
    
    return returnScreen
}

func moveDown(piece: [[Int]]) {
    
    if(pieceOffset.1 < gameScreen.count - 3) { // watches for bottom row collision
        
        pieceOffset.1 = pieceOffset.1 + 1
        
        gameScreen = showPieceOn(screen: gameScreen, piece: currentPiece)
        
    } else {
        
        gameScreen = addPieceTo(screen: gameScreen)
        
        currentPiece = nextPiece
        
        nextPiece = getRandomPieceFrom(pieces: pieces)
        
        pieceOffset.1 = 0
        
        pieceOffset.0 = gameScreen[0].count / 2
    }
}

// Clears the console (refreshes view)

func clearDaConsole() {
    
    // Creates Apple Script to clear the console
    let scriptText = "tell application \"Xcode\"\n activate\n tell application \"System Events\"\n keystroke \"k\" using command down\n end tell\n end tell "
    
    let clearScript: NSAppleScript = NSAppleScript(source: scriptText)!
    
    var error: NSDictionary?
    
    clearScript.executeAndReturnError(&error)
    
}

func testClearConsole() {
    print("This message will self destruct in 4 seconds")
    sleep(4)
    clearDaConsole()
    print("MORE STUFF TO CLEAR")
    sleep(4)
    CPlusWrapper().daClearScreenWrapped()
    print("MORE STUFF WAS CLEARED...Now to clear this a different way")
    sleep(4)
    sleep(4)
    CPlusWrapper().daClearScreen2Wrapped()
    print("MORE STUFF WAS CLEARED AGAIN")
    sleep(4)
}

func runGameLoop() {
    
    while(true) {
        
        // Moves piece down
        moveDown(piece: currentPiece)
        
        displayStats()
        
        print("NEXT PIECE: ")
        
        displayPiece(inputPiece: nextPiece)
        
        // Prints updated screen
        printGameScreen()
        
        // Waits for a second
        sleep(1)
        
        // Updates time
        time = time + 1
        
        // Clears the screen
        //clearDaConsole() // XCODE console cuts off output (varies)
        CPlusWrapper().daClearScreenWrapped() // CONSOLE APP
    }
}


// Run

currentPiece = getRandomPieceFrom(pieces: pieces)
nextPiece = getRandomPieceFrom(pieces: pieces)
runGameLoop()





