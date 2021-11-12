import UIKit

class Student {
    
    var studnumb:String
    var name:String
    var gender:String
    var studPhoto:String
    
    init(_ studnumb:String, _ name:String, _ gender:String, _ studPhoto:String) {
        self.studnumb = studnumb
        self.name = name
        self.gender = gender
        self.studPhoto = studPhoto
    }
}
