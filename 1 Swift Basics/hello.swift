enum Operator {
    case Add
    case Subtract
    case Divide
    case Multiply
}

var x = 4
var y = 7
var op:Operator = .Add
switch op {
    case .Add:
        print("\(x+y)");
    case .Subtract:
        print("\(x-y)");
    case .Divide:
        print("\(x/y)")
    case .Multiply:
        print("\(x*y)")
}



