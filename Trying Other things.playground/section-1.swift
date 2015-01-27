import Foundation

//http://ericasadun.com/2014/08/27/swift-embettering-solutions/

var myarray : [Void -> Void] = [{println("one")}, {println("two")}, {println("three")}]
var mygenerator = myarray.generate()
while let closure = mygenerator.next() {closure()}

for closure in myarray {
    closure()
}

//http://www.raywenderlich.com/76349/swift-ninja-part-1

//Challenge #4

func countFrom2(from:Int, #to:Int) ->String{
    var stringToReturn = ""
    for each in from...to{
        stringToReturn += String(each)
    }
    return stringToReturn
}

countFrom2(1, to: 5) //--> 12345

//You can’t use any loop operators, variables, nor any built-in Array functions.

// use recursion in Swift.

//Challege #3

//let resultEmpty = sumAny() //--> "0"
//let result1 = sumAny(Double(), 10, "-10", 2) //--> "12"
//let result2 = sumAny("Marin Todorov", 2, 22, "-3", "10", "", 0, 33, -5) //--> "42"


/*
func sumAny(list:Any...)-> Void{
    var result:Int = 0
    for item in list{
        switch item{
        case "" as String, 0 as Int:
            return 0
        }

    }
}
sumAny("Marin Todorov", 2, 22, "-3", "10", "", 0, 33, -5)
*/
var aa = [0,3]

aa.startIndex
aa.endIndex.predecessor()
aa.endIndex.value

//Function overloading

func square (number: Double)->Double{
    var number2 = number + 0
   return number2 * number2
}

func square (text:String) ->Double {
    var NSText  = text as NSString
    return Double(NSText.length)
}

square("nh dddey")

class heyNow {
    class func  heyWhat()->(){
        return println("This is test")
    }
}

class heyThen:heyNow{
    override class func heyWhat() -> () {
        return println("This is 2nd test")
    }
}


var newThing:heyNow = heyThen()


newThing.dynamicType.heyWhat()


//http://www.raywenderlich.com/77845/swift-ninja-part-2
//no array, no loops operators, no varibles
//reverseString("Marin Todorov") //--> "vorodoT niraM"

func reverseString( into: String, out:String = "") ->String{
    if into == ""{
        return out
    }else{
        return reverseString(into.substringToIndex(into.endIndex.predecessor()), out: out + into.substringFromIndex(into.endIndex.predecessor()))

    }}
    
reverseString("Marin Todorov")



//ENums

enum Currency {
    case EUR
    case USD
    case YEN
}


