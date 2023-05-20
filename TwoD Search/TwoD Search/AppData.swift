import Foundation


/*
 This is the basic data of the app
 */


class AppData
{
    public static let inst = AppData()
    
    // This must be 4 characters
    let searchWord = "rafa"
    var sequence : [String] = []
    // sequence of usable letters
    let letters = "abcdefghijklmnopqrstuvwxyz"
    
    // Size of the lazy grid
    let gridSize = 10
    
    var found = 0
    
    init () {
        
        let charCount = searchWord.count
        
        // you need to search for at least ONE character
        let start = searchWord.startIndex
        let firstChar = searchWord[start]
        sequence.append(String(firstChar))
        
        for i in 1..<charCount
        {
            let nextChar = searchWord[searchWord.index(start, offsetBy: i)] // 'o'
            sequence.append(String(nextChar))
        }
    }
}
