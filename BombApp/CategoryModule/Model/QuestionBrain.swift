import Foundation

class Quiestion{
    
    static var array = Array<Array<String>>()
    
    static func generateQuestions(){
        ["Miscellaneous",
         "Sport And Hobbies",
         "About Life",
         "Celebrities",
         "Art and Cinema",
         "Nature"].forEach { type in
            if let fileURL = Bundle.main.url(forResource: type, withExtension: "txt") {
                if let fileContents = try? String(contentsOf: fileURL) {
                    var appendLast = fileContents.components(separatedBy: "\n")
                    appendLast.removeLast()
                    array.append(appendLast)
                }
            }
        }
    }
}
