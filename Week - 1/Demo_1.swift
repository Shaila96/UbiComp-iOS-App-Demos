import Foundation



//------------------- Constants and Variables
let maxCount = 10
var count = 0
let myDoubleArray = [2.1, 3.5, 1.1]

print(maxCount)
print(count)
print(myDoubleArray)



var welcomeMessage: String
let myNumber: Int

// Error for using variable before initializing
// We can solve that by using optional
// print(welcomeMessage)



//------------------- Operators
var score=85
var isPassed: Bool = score >=  40 ? true : false
print(isPassed)






//------------------- Strings
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)

let str = "Hello" + " swift lovers" 
print(str)
print(str.count)



//------------------- Strings Indices
str.startIndex // position of the first character of a String
str.endIndex   // position after the last character in a String

let index = str.index(str.startIndex, offsetBy: 7)

print(str[index])   // will print the 8th character of a String
print(str.substring(to: index)) // will print everything up to the 7th character 







//------------------- Optional
var courseNonOptional: String
// error: 'nil' cannot be assigned to type 'String'
// courseNonOptional = nil


var courseName: String? = "Ubiquitous Computing"
// Optional variable can be set to nil 
courseName = nil


var possibleOptional:Int?
possibleOptional = Int("it's optional") // returns nil
print(possibleOptional)




//------------------- Control Flows
var x = 23
var y = 34
if x >= y {
    print("x is greater or equal to y")
} 
else {
    print("y is greater")
}


//------------------- Control Flows - Unwrapping optionals
let possibleNumber = "123" 		 // possibleNumber is type String

let convertedNumber = Int(possibleNumber) // convertedNumber is type Int?

if convertedNumber != nil {
    // now that we know that convertedNumber has a value, force unwrap using  “!”
    print("convertedNumber has integer value of \(convertedNumber!).")
}

//------------------- Control Flows - Optional Binding I
if let actualNumber = Int(possibleNumber) {
	print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
	print("\"\(possibleNumber)\" could not be converted to an integer")
}


//------------------- Control Flows - Optional Binding II
if let firstNumber = Int("4"), 
    let secondNumber = Int("42"), 
    firstNumber < secondNumber {

    print("\(firstNumber) < \(secondNumber)")
}


//------------------- Control Flows - Early Exit
func foo(possibleNumber : String?) {
    guard let actualNumber = Int(possibleNumber!) else {
        return
    }
    
    print("Number is: \(actualNumber)")
}

foo(possibleNumber: "13")





//------------------- Dictionaires
// var person = Dictionary<String, Int>()
var person = [String: Int]()

person["Bob"] = 18    // initializing
print(person["Bob"]!) // returns 18



//------------------- Functions
func sayHello(personName: String) -> String {
    return "Hello, " + personName + "!"
}
print(sayHello(personName: "UbiComp"))



func sumNumbers(numbers: Int...) -> Int {
	var total = 0
	for number in numbers { 
		total += number
	}
	return total
}
let sum = sumNumbers(numbers: 2,3,4,5)
print(sum)



func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for number in array { 
		currentMin = min(currentMin, number)
        currentMax = max(currentMax, number)
	}
    return (currentMin, currentMax)
}

let bounds = minMax(array:[8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


//------------------- Closures
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let sorted = names.sorted() // ["Alex", "Barry", "Chris", "Daniella", "Ewa"]

print(sorted)

let reversed1 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
}) // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
print(reversed1)

let reversed2 = names.sorted(by: {s1, s2 in s1 > s2}) // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
print(reversed2)

let reversed3 = names.sorted(by: >) // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
print(reversed3)






//------------------- Class
class Person {
    var name: String
    var gender = "Female"
    var age: Int?
    init(name: String) {
        self.name = name
    }
    // other functions and variables … … 
}

let bob = Person(name: "Lily")
bob.age = 18

print(bob.age)



































