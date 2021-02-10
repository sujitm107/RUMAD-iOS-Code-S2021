import UIKit

//Variables
//var
var x = "Swift" //String
x = "Python"

//let -- Comes in handy when we start talking about Optionals
let two = 8

//Type Declaration
var three: String = "C++"
var four: Int = 42
var seven: Bool = true
var five: String? = nil

print(x)

var name = "Craig Federighi"
var age = 52

print("My name is" + name + "I am \(age) years old")

enum Menu {
    case Pizza
    case Fries
    case ChocolateShake
    
}

//var item = Menu.Fries
//
//switch item {
//
//case .Pizza:
//    print("This item is $5")
//case .Fries:
//    <#code#>
//case .ChocolateShake:
//    <#code#>
//}

for i in 0...5{
    print(i)
}

func subtract(second: Int, first: Int) -> Int{
    return first - second
}

subtract(second: 6, first: 7)

func add(_ second: Int, _ first: Int) -> Int{
    return first + second
}

add(5, 6)

func count(to num: Int){
    for i in 0...num{
        print(i)
    }
}

count(to: 6)

