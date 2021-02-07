import UIKit

var str = "Hello, playground"

//Exercise 1
func helloSwift(name: String)->String{
    return "Swift says, Hello \(name)"
}

print(helloSwift(name:"Alay"))


//Exercise 2
enum Operator{
    case Add
    case Subtract
    case Multiply
    case Divide
}

func arithmetic(op:Operator, num1:Int,num2:Int ){
    switch op {
    case .Add:
        print("\(num1 + num2)");
    case .Subtract:
        print("\(num1 - num2)");
    case .Multiply:
        print("\(num1 * num2)");
    case .Divide:
        print("\(num1 / num2)");
    }
}
arithmetic(op: .Add, num1: 9, num2: 10)

//exercise 3

func fizzBuzz(lim:Int){
    for i in 1...lim {
        if (i%3==0 && i%5==0) {
            print("FizzBuzz");
        }else if(i%3==0){
            print("Fizz");
        }else if(i%5==0){
            print("Buzz");
        }else{
            print(i);
        }
    }
}
fizzBuzz(lim: 15)


//HW 1.1
func everyCharacter(word:String){
    for i in word{
        print(i)
    }
}
everyCharacter(word: "Swift")

//HW 1.2
func palindrome(str:String)->Bool{
    let word = str.lowercased()
    let len = word.count/2
    for index in 0..<len{
        let start = word.index(word.startIndex, offsetBy: index)
        let end = word.index(word.endIndex, offsetBy: (index * -1) - 1)
        if(word[start] != word[end]){
            return false
        }
    }
    return true
}
print(palindrome(str: "RaceCar"))
