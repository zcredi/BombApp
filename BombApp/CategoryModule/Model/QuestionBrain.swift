import Foundation

class Question {
    private var questionsArray = Array<Array<String>>()
    private var puhishmentsArray = [String]()

    func generateQuestions() {
        ["О Разном", "Спорт и Хобби", "Про Жизнь", "Знаменитости", "Исскуство и Кино", "Природа"].forEach { type in
            if let fileURL = Bundle.main.url(forResource: type, withExtension: "txt") {
                if let fileContents = try? String(contentsOf: fileURL) {
                    var appendLast = fileContents.components(separatedBy: "\n")
                    appendLast.removeLast()
                    questionsArray.append(appendLast)
                }
            }
        }
    }

    func generatePunishments() {
        if let fileURL = Bundle.main.url(forResource: "Наказания", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                var apendLast = fileContents.components(separatedBy: "\n")
                apendLast.removeLast()
                puhishmentsArray = apendLast
            }
        }
    }
    func getRandomPunishments() -> String{
        return puhishmentsArray.randomElement()!
    }
    
    func getCurrentCategory(category: [String]) -> [String]{
        var array = [String]()
        for item in category{
            switch item{
                case "О Разном": array += questionsArray[0]
                case "Спорт и Хобби": array += questionsArray[1]
                case "Про Жизнь": array += questionsArray[2]
                case "Знаменитости": array += questionsArray[3]
                case "Исскуство и Кино": array += questionsArray[4]
                case "Природа": array +=  questionsArray[5]
                default: continue
            }
        }
        return array
    }
}
