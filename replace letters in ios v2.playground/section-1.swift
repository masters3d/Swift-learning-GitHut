
import UIKit



//Swift-ify Inflationary English
// Function "inflationary()" at the bottom

extension Array {
    func contains<T : Equatable>(obj: T) -> Bool {
        let filtered = self.filter {$0 as? T == obj}
        return filtered.count > 0
    }
}


extension String {
subscript (i: Int) -> String {
    return String(Array(self)[i])
    }

    public func find(sub: String, _ start:Int = 0) -> Int {
        let subArr = Array(sub)
        if subArr.count == 0 {
            return 0
        }
        let stringArr = Array(self)
        if subArr.count > stringArr.count {
            return -1
        }
        if start > stringArr.count {
            return -1
        }
        if start < 0 {
            return -1
        }
        
        if start < stringArr.count - 1 {
        
        
        for i in start..<stringArr.count - subArr.count + 1 {
            if stringArr[i] == subArr[0] {
                let readAhead = stringArr[i..<i + subArr.count]
                if equal(readAhead, subArr) {
                    return i
                }
            }
        }}
        return -1
    }
    
    public func index(sub: String) -> Int {
        return self.find(sub)
    }




}

func encode (textIn:String, stripHW:Bool = false) -> (String, String){
    var textOut:String = ""
    var HW:Character = stripHW ? "9" : "0"
    for each in textIn{
        var tempSwitch = each
        switch tempSwitch {
        case "0","1","2","3","4","5","6","7","8","9":textOut.append(Character("#"))
        case "a", "e", "i" , "u" , "y" :textOut.append(Character("0"))
        case "A", "E", "I" , "U" , "Y" : textOut.append(Character("0"))
        case "O","o":textOut.append(Character("7"))
        case "h" , "w","H" , "W":textOut.append(HW)
        case "b", "f", "p", "v","B", "F", "P", "V":textOut.append(Character("1"))
        case "c", "g", "j", "k", "q", "s", "x", "z":textOut.append(Character("2"))
        case "C", "G", "J", "K", "Q", "S", "X", "Z":textOut.append(Character("2"))
        case "d","D", "t", "T":textOut.append(Character("3"))
        case "l","L": textOut.append(Character("4"))
        case "m","M", "n", "N":textOut.append(Character("5"))
        case "r", "R":textOut.append(Character("6"))
        default:textOut.append(each) }
    }
    // Strip H & W if turned on
    
    var textCode = ""
    var textMod = ""
    
    for (inx,ea) in enumerate(String(textOut)){
        if ea == "9"{
            //Pass
        }else{
            textCode.append(ea)
            textMod.append(Character(textIn[inx]))
        }
    }
    return (textMod, textCode)
}


func int2txt (inInt:Int)->String{
    var strOut = ""
    switch inInt{
    case 1 : strOut = "one"
    case 2 : strOut = "two"
    case 3 : strOut = "three"
    case 4 : strOut = "four"
    case 5 : strOut = "five"
    case 6 : strOut = "six"
    case 7 : strOut = "seven"
    case 8 : strOut = "eight"
    case 9 : strOut = "nine"
    case 10 : strOut = "ten"
    case 11 : strOut = "eleven"
    case 12 : strOut = "twelve"
    case 13 : strOut = "thirteen"
    case 14 : strOut = "fourteen"
    case 15 : strOut = "fifteen"
    case 16 : strOut = "sixteen"
    case 17 : strOut = "seventeen"
    case 18 : strOut = "eighteen"
    case 19 : strOut = "nineteen"
    default : strOut = String(inInt)
    }
    return strOut
}


var numberCoding = [["2067"],
    ["750"],  //1 "005",
    ["307", "202753", "30020" ], //2 , "30"
    ["30600", "30063"],          //3
    ["1706", "17630", "176"],            //4
    ["1010", "10130"],             //5
    ["20230","202"],                   //6
    ["20105", "201030"],                //7
    ["00203", "002030"], //8 ,"030"
    ["5050"],        //9
    ["305" ],          //10
    ["040105", "04010530"],             //11
    ["300410", "3004130"]               //12
]





func firstPass(textIn:String)-> [AnyObject] {
    var track:Array = []
    var codeNum = numberCoding
    var textOut = encode(textIn).1
    for (inx,each) in enumerate(codeNum){
        for ea in each{
            var i = 0
            var e = 0
            while e != -1 {
                if textOut.find(ea, i) == -1 {
                    i = textOut.find(ea, i + 1)
                    e = textOut.find(ea, i)
                } else {
                    
                    
                    
                    
                    
                    if !track.contains([inx,textOut.find(ea, i),Array(ea).count ]){
                track.append([inx,textOut.find(ea, i),Array(ea).count ])
                    }
                i = textOut.find(ea, i + 1)
                e = textOut.find(ea, i)
                
                }
            }


        
        }
        }
            return track
    }


//firstPass("one two three four five six seven")

func secondPass(firstPassArray:[AnyObject]) -> [AnyObject]{
    var outArray = firstPassArray.reverse()
    var number:Int = -1
    var position:Int = -1
    var index2remove:Array = []
    for (inx, each) in enumerate(firstPassArray.reverse()){
        if position == each[1] as Int {
            index2remove.append(inx)
        }
        number = each[0] as Int
        position = each[1] as Int
    }
    for (idx, each) in enumerate(index2remove){
        var remove = each as Int
        outArray.removeAtIndex(remove - idx)
    }
    
    return outArray
}


func thirdPass(secondPassArray:[AnyObject]) -> [AnyObject]{
    var trackMain:Array = []
    for (idx,each) in enumerate(secondPassArray){
        let num =   each[0] as Int
        let start = each[1] as Int
        let lenght = each[2] as Int
        let range = start...(start + lenght - 1)
     
        
     // First level
        for (idx2,each2) in enumerate(secondPassArray){
            let num2 =   each2[0] as Int
            let start2 = each2[1] as Int
            let lenght2 = each2[2] as Int
            let range2 = start2...(start2 + lenght2 - 1)
            
            
            if idx != idx2{
                for ea2 in range2{
                    
                    let intSwitch = ea2
                    switch intSwitch{
                    case start...(start + lenght - 1):
                       // println("match")
                        
                        if !trackMain.contains([idx, idx2, num , num2 ]){
                            
                            
                            trackMain.append([idx, idx2, num , num2 ])}
                    default: "none"
                    }
                    
                }
        
    //Second level
            
        }
    // First for loop
        
    }
    
    
    }
    return trackMain

}
//[[1, 1, 3], [9, 0, 4]]

//thirdPass(secondPass(firstPass("one to three four five six seven eight nine ten eleven twelfe thirteen fourteen")))

//thirdPass(secondPass(firstPass(" one two three four five six seve eight nine ten eleven twelve thirteeen")))


func inflationary (inText:String) -> String {
    //var inArray = Array(inText)
    var outText:String = ""
    var toReplace01 = secondPass(firstPass(inText))
    var toReplace02:[(position:Int,lenght:Int, num:Int )] = []
    
    
    for ea3 in toReplace01{
        let a = ea3[0] as Int
        let b = ea3[1] as Int
        let c = ea3[2] as Int
        
        toReplace02.append(position: b , lenght: c , num: a)
    }
    

    
    toReplace02.sort({ $0.position > $1.position })
    
    var toReplace = toReplace02.reverse()
    
    
    //toReplace.insert([0,0,0], atIndex: 0)
    //toReplace.append([99, Array(inText).count, 0])
    
    var prevNum = 0 //toReplace[0][0] as Int
    var prevPosition = 0 // toReplace[0][1] as Int
    var prevLenght = 0 // toReplace[0][2] as Int
    
    for each in toReplace{
        let num =       each.num as Int
        let position =  each.position as Int
        let lenght =    each.lenght as Int
        let textNum = int2txt(num + 1 )
        let endPositionLength = position - prevPosition
        println( "\(prevPosition) \(position )")

        let startIndex = advance(inText.startIndex, prevPosition )
        let endIndex = advance(startIndex, endPositionLength )
        let rangeSE = startIndex..<endIndex
        println( "\(startIndex) \(endIndex) INDEX \(lenght) ")

        //let textRange = advance(inText.startIndex, prevPosition)..<advance(inText.startIndex, position)

        //outText += inText.substringWithRange(startIndex..<endIndex) + "NUM"
        outText += inText[rangeSE] + textNum
        
        prevNum = num
        prevPosition = position + lenght
        prevLenght = lenght
        
    }
    return outText
}

inflationary("one two three four five six seven eight nine ten eleven twelve")


/*
//Phonetic test
encode("zero").1
encode("one").1
encode("two, second, twice").1
encode("three, third, ").1
encode("four, forth, for, ").1
encode("five, fifth").1
encode("six, sixth").1
encode("seven, seveth").1
encode("eight, eighth").1
encode("nine").1
encode("ten").1
encode("eleven, eleventh").1
encode("twelve, twelfth").1
*/







