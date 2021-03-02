import UIKit

var names: [String] = ["Duncan", "Mark", "Mike", "John", "Penelope", "Donald", "Daffy"]

//Take a list of names, sort them into sets, then output then into an ordered list.

//go through every single name and put them into a dictionary based on the first letter

var namesDictionary: [Character: [String]] = [:]

for name in names{
    
    let firstChar = name[name.startIndex]
    var list = namesDictionary[firstChar] ?? []
    list.append(name)
    namesDictionary[firstChar] = list
}

//sort the dictionary based on the keys
for key in namesDictionary.keys.sorted(){
    
    for name in namesDictionary[key]!{
        print(name)
    }
    
}

//section headers
print(namesDictionary.keys.sorted()[0])

//length of section
let key = namesDictionary.keys.sorted()[0]
print(namesDictionary[key]!.count)

printNameAtSectionRow(section: 0, row: 1)

func printNameAtSectionRow(section: Int, row: Int){
    
    let key = namesDictionary.keys.sorted()[section]
    
    print(namesDictionary[key]![row])
    
}






