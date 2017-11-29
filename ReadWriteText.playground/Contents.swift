//:#  ReadWriteText
//: A Demonstration of reading and writing file to disk, in this case the documents directory

import UIKit


class ReadWriteText{
    var DocumentDirURL:URL{
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return url
    }
    func fileURL(fileName:String,fileExtension:String)-> URL{
        return DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    }
    func writeFile(writeString:String,fileName:String,fileExtension:String = "txt") {
        let url = fileURL(fileName: fileName, fileExtension: fileExtension)
        do{
            try writeString.write(to: url, atomically: true, encoding: .utf8)            
        } catch let error as NSError {
            print ("Failed writing to URL: \(fileURL), Error:" + error.localizedDescription)
        }
    }    
    func readFile(fileName:String,fileExtension:String = "txt") -> String {
        var readString = ""
        let url = fileURL(fileName: fileName, fileExtension: fileExtension)
        do{
            readString = try String(contentsOf: url)           
        } catch let error as NSError {
            print ("Failed writing to URL: \(fileURL), Error:" + error.localizedDescription)
        }
        return readString
    }
    
}
let message = "Hello, Pizza!!!"
let textFileName = "Pizza"
let rwt = ReadWriteText()
rwt.writeFile(writeString: message, fileName: textFileName)
print(rwt.readFile(fileName: textFileName"))



