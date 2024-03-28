import Foundation
//
//  TryCatch.swift
//
//  Created by Ioana Marinescu
//  Created on 2024/02/23
//  Version 1.0
//  Copyright (c) 2024 Ioana Marinescu. All rights reserved.
//
//  A program that calculates the length of a board.

// creates custom errors
enum InputError: Error {
  // invalid input error
  case invalidInput
}

// function to get user input that returns a double
func userInput(message: String) throws -> Float {
  // asks user for what they need to input
  print(message)
  // gets input and throws error if anything is invalid
  guard let input = readLine(), let userInput = Float(input) else {
    throw InputError.invalidInput
  }
  return userInput
}

// Function calculates the length of board foot
func calcBoardFoot(height: Float, width: Float) -> Float {
  // Constant for volume
  let VOLUME: Float = 144.0

  // Returns calculation for length
  return VOLUME / (width * height)
}

do  {
  // getting user input
  let height = try userInput(message:"Enter the height:")
  let width = try userInput(message:"Enter the width:")

  if height <= 0 || width <= 0 {
    throw InputError.invalidInput
  }

  // length calculations
  let length = calcBoardFoot(height: height, width: width)

  // display to console rounded to 2 decimal places
  print("The length of the board is \(round(100 * length) / 100) inches cubed.")
  
  // error handling
} catch InputError.invalidInput {
  print("Invalid input. Please enter a positive integer or decimal value.")
}