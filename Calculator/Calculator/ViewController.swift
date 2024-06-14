import UIKit

class ViewController: UIViewController {
    
    enum SpecialSymbols: Character, CaseIterable {
        case precent = "%"
        case multipicationMark = "×"
        case dividingMark = "÷"
        case minus = "-"
        case plus = "+"
        case point = "."
    }
    
    enum SpecialSymbolsWithoutPoint: Character, CaseIterable {
        case precent = "%"
        case multipicationMark = "×"
        case dividingMark = "÷"
        case minus = "-"
        case plus = "+"
    }
    
    @IBOutlet weak var workings: UILabel!
    
    @IBOutlet weak var results: UILabel!
    
    @IBOutlet weak var leftBracket: UIButton!
    
    @IBOutlet weak var rightBracket: UIButton!
    
    @IBOutlet weak var sinButton: UIButton!
    
    @IBOutlet weak var cosButton: UIButton!
    
    @IBOutlet weak var squareRootButton: UIButton!
    
    @IBOutlet weak var lgButton: UIButton!
    
    @IBOutlet weak var lnButton: UIButton!
    
    @IBOutlet weak var factButton: UIButton!
    
    var workingString: String = ""
    
    var resultsString: String = ""
    
    func isHiddenForButtons(_ bool: Bool) {
        leftBracket.isHidden = bool
        rightBracket.isHidden = bool
        sinButton.isHidden = bool
        cosButton.isHidden = bool
        squareRootButton.isHidden = bool
        lgButton.isHidden = bool
        lnButton.isHidden = bool
        factButton.isHidden = bool
    }
    func calcLog(_ str: String) -> String {
        if(str == "0") {
            return "В логарифме 0"
        }
        if(str == "Ошибка") {
            return "Ошибка"
        }
        if(str.isEmpty) {
            return "Пустое поле"
        }
        if(str != "0" || str != "Ошибка" || str != "") {
            var number: Double = 0.0
            let expression = NSExpression(format: str)
            number = expression.expressionValue(with: nil, context: nil) as! Double
            if(number < 0) {
                return "Под логарифмом отрицательное число"
            }
            let answer: String = String(log10(number))
            return answer
        }
        return "Ошибка"
    }
    
    func calcLn(_ str: String) -> String {
        if(str == "0") {
            return "В логарифме 0"
        }
        if(str == "Ошибка") {
            return "Ошибка"
        }
        if(str.isEmpty) {
            return "Пустое поле"
        }
        if(str != "0" || str != "Ошибка" || str != "") {
            var number: Double = 0.0
            let expression = NSExpression(format: str)
            number = expression.expressionValue(with: nil, context: nil) as! Double
            if(number < 0) {
                return "Под логарифмом отрицательное число"
            }
            let answer: String = String(log(number))
            return answer
        }
        return "Ошибка"
    }
    
    func calcSqrt(_ str: String) -> String {
        if(str == "0") {
            return "0"
        }
        if(str == "Ошибка") {
            return "Ошибка"
        }
        if(str.isEmpty) {
            return "Пустое поле"
        }
        if(str != "0" || str != "Ошибка" || str != "") {
            var number: Double = 0.0
            let expression = NSExpression(format: str)
            number = expression.expressionValue(with: nil, context: nil) as! Double
            if(number < 0) {
                return "Под корнем отрицательное число"
            }
            let answer: String = String(sqrt(number))
            return answer
        }
        return "Ошибка"
    }
    
    func calcSin(_ str: String) -> String {
        if(str == "0") {
            return "0"
        }
        if(str == "Ошибка") {
            return "Ошибка"
        }
        if(str.isEmpty) {
            return "Пустое поле"
        }
        if(str != "0" || str != "Ошибка" || str != "") {
            var number: Double = 0.0
            let expression = NSExpression(format: str)
            number = expression.expressionValue(with: nil, context: nil) as! Double
            let answer: String = String(sin(number * Double.pi / 180.0))
            return answer
        }
        return "Ошибка"
    }
    
   
    
    func calcCos(_ str: String) -> String {
        if(str == "0") {
            return "1"
        }
        if(str == "Ошибка") {
            return "Ошибка"
        }
        if(str.isEmpty) {
            return "Пустое поле"
        }
        if(str != "0" || str != "Ошибка" || str != "") {
            var number: Double = 0.0
            let expression = NSExpression(format: str)
            number = expression.expressionValue(with: nil, context: nil) as! Double
            let answer: String = String(cos(number * Double.pi / 180.0))
            return answer
        }
        return "Ошибка"
    }
    
    func factorial(_ n: UInt64) -> UInt64 {
        if n < 1 {
            return 1
        }
        return n * factorial(n - 1)
    }
    
    func calcFact(_ str: String) -> String {
        if(str == "Ошибка") {
            return "Ошибка"
        }
        if(str.isEmpty) {
            return "Пустое поле"
        }
        if(str != "Ошибка" || str != "") {
            var number: Double = 0.0
            let expression = NSExpression(format: str)
            number = Double(truncating: expression.expressionValue(with: nil, context: nil) as! NSNumber)
            if(number < 0) {
                return "Отрицательное число"
            }
            if(number > 20) {
                return "Не могу посчитать"
            }
            let intNumber = Int(number)
            if(number - Double(intNumber) == 0) {
                var qwerty: Int = intNumber
                var strrr: String = ""
                while(true) {
                   
                    strrr = strrr + String(qwerty) + "*"
                    workingString = strrr
                    strrr = equals()
                    qwerty = qwerty - 1
                    if(qwerty == 0) {
                        break
                    }
                    strrr = strrr + "*"
                }
                workingString = strrr
                return equals()
            }
        }
        return "Не могу посчитать"
    }
    
    func equals() -> String {
        if(workingString.isEmpty) {
            return ""
        }
        if(!workingString.isEmpty){
            var checkedWorkingForPercent = workingString.replacingOccurrences(of: "%", with: "*0.01")
            let lastSymbol = checkedWorkingForPercent.last
            for char in SpecialSymbols.allCases {
                if(lastSymbol == char.rawValue) {
                    checkedWorkingForPercent.removeLast()
                }
            }
            
            let checkedWorkingForMultiplacation = checkedWorkingForPercent.replacingOccurrences(of: "×", with: "*")
            var checkedWorkings: String = ""
            if(!checkedWorkingForMultiplacation.contains(".")) {
                let checkedWorking = checkedWorkingForMultiplacation.replacingOccurrences(of: "÷", with: ".0/")
                checkedWorkings = checkedWorking
            } else {
                let checkedWorking = checkedWorkingForMultiplacation.replacingOccurrences(of: "÷", with: "/")
                checkedWorkings = checkedWorking
            }
            while(true) {
                if(checkedWorkings.last == "(" || checkedWorkings.last == "/" || checkedWorkings.last == "+" || checkedWorkings.last == "-" || checkedWorkings.last == "*") {
                    checkedWorkings.removeLast()
                    continue
                } else {
                    break
                }
            }
            
            let tuple = checkingForBrackets(forString: checkedWorkings)
            if(tuple.1 == false) {
                workingString = ""
                workings.text = workingString
                return "Ошибка"
            }
            for _ in 0..<tuple.0 {
                checkedWorkings.append(contentsOf: ")")
            }
            let expression = NSExpression(format: checkedWorkings)
            let result = expression.expressionValue(with: nil, context: nil) as! NSNumber
            let resultString = formatResult(result: result)
            workingString = ""
            workings.text = workingString
            return resultString
        }
        return ""
    }
    
    func checking() {
        if(workingString.first == "%" || workingString.first == "." || workingString.first == "+" || workingString.first == "÷" || workingString.first == "×" || workingString.first == "-" && workingString.count < 2) {
            workingString = ""
        }
        
        if(workingString.count > 1) {
            for char1 in SpecialSymbols.allCases {
                for char2 in SpecialSymbols.allCases {
                    if(workingString.last == char1.rawValue && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == char2.rawValue) {
                        workingString.remove(at: workingString.index(workingString.endIndex, offsetBy: -2))
                    }
                }
            }
        }
    }
    
    func checkingForPercent() {
        if(workingString.last == "%") {
            workingString.removeLast()
        }
    }
    
    func checkingForPoint() {
        if(workingString.contains(".")) {
            return
        }
    }
    
    func checkingForBrackets(forString: String) -> (Int, Bool) {
        var counter1 = 0
        var counter2 = 0
        var bool: Bool = true
        for char in forString {
            if(char == "(") {
                counter1 = counter1 + 1
            }
            if(char == ")") {
                counter2 = counter2 + 1
            }
        }
        if(forString.count == counter1 || forString.count == counter2 || forString.count == counter1 + counter2) {
            bool = false
        }
        if(forString.first == ")") {
            return (0, false)
        }
        
        
        if(counter2 > counter1) {
            bool = false
        }
        return (counter1 - counter2, bool)
    }
    
    func checkingForZero() -> Bool {
        if(workingString.last == "0" && workingString.count == 1) {
            return false
        }
        for char in SpecialSymbolsWithoutPoint.allCases {
            if(workingString.last == "0" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == char.rawValue && workingString.count > 1) {
                return false
            }
        }
        return true
    }
    
    func allClear() {
        workingString = ""
        workings.text = ""
        results.text = ""
    }
    
    func addToWorkings(value: String) {
        workingString = workingString + value
    }
    
    func printWorkings() {
        workings.text = workingString
    }
    
    func formatResult(result: NSNumber) -> String {
        return result.stringValue
    }
    
    func formatResultDouble(result: Double) -> String {
        return String(result)
    }
    
    @IBAction func clearAll(_ sender: Any) {
        allClear()
    }
    
    @IBAction func backspace(_ sender: Any) {
        if(!workingString.isEmpty) {
            workingString.removeLast()
            workings.text = workingString
            if(workingString.count == 1 && workingString.first == "-") {
                workingString.removeLast()
                workings.text = workingString
            }
        }
    }
    
    @IBAction func prercentTap(_ sender: Any) {
        if(workingString.last == "(") {
            return
        }
        addToWorkings(value: "%")
        checking()
        printWorkings()
    }
    
    @IBAction func multiplicateTap(_ sender: Any) {
        if(workingString.last == "(") {
            return
        }
        addToWorkings(value: "×")
        checking()
        printWorkings()
    }
    
    @IBAction func divideTap(_ sender: Any) {
        if(workingString.last == "(") {
            return
        }
        addToWorkings(value: "÷")
        checking()
        printWorkings()
    }
    
    @IBAction func minusTap(_ sender: Any) {
        if(workingString.last == "(") {
            return
        }
        addToWorkings(value: "-")
        checking()
        printWorkings()
    }
    
    @IBAction func plusTap(_ sender: Any) {
        if(workingString.last == "(") {
            return
        }
        addToWorkings(value: "+")
        checking()
        printWorkings()
    }
    
    @IBAction func inverseTap(_ sender: Any) {
        if(workingString.isEmpty) {
            return
        }
        if(workingString.contains("%")) || (workingString.contains("÷")) || (workingString.contains("+")) || (workingString.contains("×")) || (workingString.contains("-") && workingString.lastIndex(of: "-") != workingString.startIndex) {
            return
        } else {
            if(workingString.first != "-") {
                workingString.insert("-", at: workingString.startIndex)
                printWorkings()
            } else {
                workingString.removeFirst()
                printWorkings()
            }
        }
    }
    ///euwofulr3giufphwprihfuiwprhfiwhrifhwirfhiwrhfoierhwrifhwrfiwrfoihewrrofhoiewrhfoierhfoiehrofihr
    
    @IBAction func leftBracketTap(_ sender: Any) {
        for i in ["0","1","2","3","4","5","6","7","8","9","%"] {
            if(workingString.last == Character(i)) {
                workingString = workingString + "×"
            }
        }
        if(workingString.last == ")") {
            return
        }
        addToWorkings(value: "(")
        checking()
        printWorkings()
    }
    
    @IBAction func rightBracketTap(_ sender: Any) {
        let tuple = checkingForBrackets(forString: workingString)
        if(workingString.last == "(") {
            return
        }
        if(workingString.last == ".") {
            return
        }
        if(tuple.0 > 0) {
            addToWorkings(value: ")")
            checking()
            printWorkings()
        }
    }
    
    @IBAction func sinTap(_ sender: Any) {
        let answer = calcSin(equals())
        results.text = answer
    }
    
    @IBAction func cosTap(_ sender: Any) {
        let answer = calcCos(equals())
        results.text = answer
        
    }
    
    @IBAction func squareTap(_ sender: Any) {
        let answer = calcSqrt(equals())
        results.text = answer
    }
    
    @IBAction func lgTap(_ sender: Any) {
        let answer = calcLog(equals())
        results.text = answer
    }
    
    @IBAction func lnTap(_ sender: Any) {
        let answer = calcLn(equals())
        results.text = answer
    }
    
    @IBAction func factTap(_ sender: Any) {
        let answer = calcFact(equals())
        results.text = answer
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        results.text = equals()
    }
    
    @IBAction func oneTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "1")
        }
        printWorkings()
    }
    
    @IBAction func twoTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "2")
        }
        printWorkings()
    }
    
    @IBAction func threeTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "3")
        }
        printWorkings()
    }
    
    @IBAction func fourTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "4")
        }
        printWorkings()
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "5")
        }
        printWorkings()
    }
    
    @IBAction func sixTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "6")
        }
        printWorkings()
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "7")
        }
        printWorkings()
    }
    
    @IBAction func eightTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "8")
        }
        printWorkings()
    }
    
    @IBAction func nineTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "9")
        }
        printWorkings()
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        if(workingString.last == "%" && workingString[workingString.index(workingString.endIndex, offsetBy: -2)] == ")") {
            return
        }
        checkingForPercent()
        if(workingString.last == ")") {
            return
        }
        if(checkingForZero() == true) {
            addToWorkings(value: "0")
        }
        printWorkings()
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        if(workingString.isEmpty) {
            return
        }
        if(workingString.last == "(" && workingString.last == ")") {
            return
        }
        if(workingString.last == ")") {
            return
        }
        if(!workingString.contains(".")) {
            addToWorkings(value: ".")
            checking()
            printWorkings()
        }
        let a = workingString.lastIndex(of: ".")!
        var b = workingString.startIndex
        for char in SpecialSymbolsWithoutPoint.allCases {
            if(workingString.contains(char.rawValue)) {
                let c = workingString.lastIndex(of: char.rawValue)!
                if(c >= b) {
                    b = c
                }
            }
        }
        for char in SpecialSymbolsWithoutPoint.allCases {
            if(workingString.last == char.rawValue) {
                return
            }
        }
        if(a < b)
        {
            addToWorkings(value: ".")
            checking()
            printWorkings()
        }
        else {
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isHiddenForButtons(true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if(UIDevice.current.orientation.isFlat) {
            return
        }
        if(UIDevice.current.orientation == UIDeviceOrientation(rawValue: 1) || UIDevice.current.orientation == UIDeviceOrientation(rawValue: 5) || UIDevice.current.orientation == UIDeviceOrientation(rawValue: 6)) {
            //            resultsString = results.text!
            DispatchQueue.main.async(qos: .background) {
                self.isHiddenForButtons(true)
                self.workings.text = ""
                //                self.results.text = ""
                self.workings.text = self.workingString
                //                self.results.text = self.resultsString
            }
        } else {
            //            resultsString = results.text!
            DispatchQueue.main.async(qos: .background) {
                self.isHiddenForButtons(false)
                self.workings.text = ""
                //                self.results.text = ""
                self.workings.text = self.workingString
                //                self.results.text = self.resultsString
            }
        }
    }
}




