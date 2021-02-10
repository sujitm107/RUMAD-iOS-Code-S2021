import UIKit

//Hello Swift -- also this is how a comment looks like
print("Hello Swift")

// Variables
//vars are mutable, can be changed
var one = 5
one = 7

//lets are immuatable, cannot be changed
let two = 8
//two = 5 -- can't do this, let variables can be defined only once
//Type Declaration
var three: String = "Python"
let four: Int = 42

var five: String? = nil

var six: [Int] = [1, 3, 5]
var seven: Bool = true


//Type Casting -- will cover next week
//Strings -- value types, not reference types like in Java
var name: String = "Craig Federighi"
var age: Int = 52

/*
 
 called string interpolation, allows us to include variables in Strings
 
 Note we cannot do things like "My name is" + <var>:Int, will not automatically convert Ints to Strings. But, we can do this "My name is" + <var>:String
 
 Btw, this is a multi-lined comment
 */
print("My name is " + name + "I am \(age) years old")


//Enums
enum Menu {
    case Pizza
    case Fries
    case ChocolateShake
    case ChickenNuggets
    case BuffaloChickenSandwich
    case HenrysClassic
}

var item: Menu = .Fries

//Switch -- must be exhaustive, otherwise provide a default
switch item {
    case .Pizza, .Fries:
        print("The item costs $5")
    case .ChocolateShake:
        print("The item costs $7")
    case .ChickenNuggets:
        print("This item costs $8")
    case .BuffaloChickenSandwich:
        print("This item costs $3")
    case .HenrysClassic:
        print("The Henry's Classic is $5")
}

//Loops
//For in loops
for i in 0...5{
    print(i)
}

for i in 0..<5{
    print(i)
}

for i in (0..<5).reversed(){
    print(i)
}

//While Loops
var x: String = "Swift"
var offset: Int = 0

while x[x.index(x.startIndex, offsetBy: offset)] != "i" {
    
    print(x[x.index(x.startIndex, offsetBy: offset)])
    offset += 1
}

var count: Int = 10
repeat {
    
    print(count)
    count -= 1

} while(count > 0)

//functions
//In swift, by default we have to name our parameters, also we provide the return type after the function signature like so "-> Int" to indicate we're returning an Int
func subtract(second: Int, first: Int) -> Int {
    
    return first - second
    
}
subtract(second: 6, first: 4 ) // 2
//However, it gives us the option not to like so...
func add(_ x: Int,_ y: Int) -> Int{
    
    return x + y
    
}
add(5, 6) // 11
//we also can have internal and external names
func count(to num: Int){
    for i in 0...num {
        
        print(i)
        
    }
}
count(to: 7)

/*
 In case you were wondering, we also have access modifiers in Swift. We have open, public, internal, fileprivate, private(most restrictive)
 */

