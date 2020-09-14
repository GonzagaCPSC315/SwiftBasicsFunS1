//
//  main.swift
//  Swift Basics Fun
//
//  Created by Gina Sprint on 9/1/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import Foundation

print("Hello, World!")
print("Another print statement")

// one line comment
/*
 this is
 a
 multi line comment
 */

// MARK: - Variables
// every type in swift is an object, which means there are no primitives
var temperature: Int = 75
print(temperature)
// swift can infer types
var temperature2 = 74.9
// Int, Float, Double, Bool, Character, String, Array, Set, Dictionary, etc.
// use let to declare a constant
let month = "September"
let day = 1
print(month)
// string interpolation
print("Today is \(month) \(day)")
// task 1: declare two constants, one for your first name and one for your last name
// print on one line "gina sprint has 10 characters"
let firstName = "gina"
let lastName = "sprint"
let numChars = firstName.count + lastName.count
print("\(firstName) \(lastName) has \(numChars) characters")

// MARK: - Arrays
var quarantineWords: [String] = ["home", "sleep", "netflix"]
print(quarantineWords)
print(quarantineWords.count)
print(quarantineWords.isEmpty)
// 0 based indexing
print(quarantineWords[0])
// can grow or shrink in size
quarantineWords.append("pajamas")
print(quarantineWords)
// task 2: remove the first element in the array
quarantineWords.remove(at: 0)
print(quarantineWords)

// MARK: - Random Numbers
// lets throw a 6-sided die
let randNum = arc4random_uniform(6) + 1
print(randNum)
// type cast
let randNumInt = Int(randNum)

// MARK: - Conditionals
// Swift has a C-style if/else if/else structure
// Swift has Swifty style switch structure (cover later)
var x = 100
if x >= 100 {
    print("x is large")
}
else {
    print("x is not large")
}

// MARK: - Loops
// 3 loops
// C style while, C style repeat-while (do-while), Swifty for in
// no C style for loop: for (int i = 0; i < 10; i++)
for i in 0..<10 {
    print(i, terminator: ", ")
}
print()

// task 3: solve this problem using each of the three loops
// print the first 20 even numbers
// 2, 4, 6, ... , 40
// while loop solution
var i = 2
while i <= 40 {
    print(i, terminator: " ")
    i += 2
}
print()

// repeat while solution
i = 2
repeat {
    print(i, terminator: " ")
    i += 2
} while i <= 40
print()

// for in solution
for i in stride(from: 2, to: 42, by: 2) {
    print(i, terminator: " ")
}
print()

// MARK: - Optionals
// an optional is a variable that either stores a value OR nil
var myOptionalInt: Int? = nil
// before we can use a value in an optional, we have to check if there is one
// first, this is called "unwrapping"
// 2 ways to do this
// 1. force unwrapping (not best practice)
myOptionalInt = 10
var myInt: Int = myOptionalInt! // force unwrap
print(myInt)

// 2. optional binding (preferred approach)
// if there is a value in the optional, store in a temporary variable
// and use that variable safely
myOptionalInt = nil
if let myInt2 = myOptionalInt {
    // safely use myInt2 the Int
    print(myInt2)
}
else {
    print("myOptinalInt is nil")
}

// caution: don't do this...
if myOptionalInt != nil {
    myInt = myOptionalInt!
}

//var friends = ["Chandler", "Monica", "Ross", "Rachel"]
//print(friends)
//print(friends.count)
//friends.insert("Phoebe", at: 1)
//print(friends)
//print("Please enter a friend: ", terminator: "")
//let inputStringOptional = readLine()
//if let inputString = inputStringOptional {
//    print("trying to remove: " + inputString)
//    let optionalIndex = friends.firstIndex(of: inputString)
//    if let myIndex = optionalIndex {
//        friends.remove(at: myIndex)
//        print(friends)
//    }
//}

// MARK: - Functions
// no params, no return
func sayHello() {
    print("hello")
}
// in main.swift can you have executable code outside of a function
sayHello()

// one param, no return
// message is both the internal and external parameter name
func say(message: String) {
    print(message)
}
say(message: "hola") // message is the argument label (external param name)
// calling a function should read like an english sentence

// task 4: define/call a function that accepts a radius
// and prints the area of a circle
func computeCircleArea(radius: Double) {
    let area = Double.pi * pow(radius, 2)
    print(area)
}
computeCircleArea(radius: 5.0)

// one param, with return value
// we can have different external param... e.g. withRadius
// _ is the anonymous variable
func computeCircleArea2(_ radius: Double) -> Double {
    let area = Double.pi * pow(radius, 2)
    return area
}
print(computeCircleArea2(5.0))

// structs and enums object pass by value
// Int, Double, Float, Array, String, etc.
// classes object types pass by reference
// to pass a value type (struct or enum) by reference use the inout keyword
func increment(value: inout Int, by incrementAmount: Int) {
    value += incrementAmount
}
var y = 5
increment(value: &y, by: 100)
print(y)

// MARK: - Strings
// a String a sequence of Characters
// a Character is one or more Unicodes
// over 143,000 unicodes
// swift is fully unicode compliant
var pig = "🐷" // ctrl + cmd + spacebar (character viewer)
print(pig)
var 🐷 = "pig pace"
print(🐷)

// concatenation +
// relational operators < <= > >=
// equality operators == !=
// there are useful properties (count, isEmpty, ...) and methods (lowercased(), hasSuffix(), contains())
// you cannot [0]
// instead you have to use String.Index
var course = "CPSC315"
// we want to print the first C
let indexOfFirstCharacter = course.startIndex // like 0
print(course[indexOfFirstCharacter])
// we want to print out the 3 at index [4]
let indexOfTheFourthCharacter = course.index(course.startIndex, offsetBy: 4) // like 4
print(course[indexOfTheFourthCharacter])

// task 5: define/call a function that accepts two strings
// and returns true if the strings have the same last character, false otherwise
// ex: "gonzaga", "zebra", -> True
// ex: "spokane", "gonzaga" -> False
func hasSameLastCharacter(_ string1: String, _ string2: String) -> Bool {
    // should check that each string has at least one character!!!
    let lastIndex1 = string1.index(before: string1.endIndex)
    let lastIndex2 = string2.index(before: string2.endIndex)

    return string1[lastIndex1] == string2[lastIndex2]
}

print(hasSameLastCharacter("gonzaga", "zebra"))
print(hasSameLastCharacter("spokane", "gonzaga"))
