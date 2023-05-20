import Foundation


/*
 This is the basic data of the app
 */


class AppData
{
    public static let inst = AppData()
    
    let searchWord = "rafa"
    var sequence : [String] = []
    // sequence of usable letters
    let letters = "abcdefghijklmnopqrstuvwxyz"
    
    // Size of the lazy grid
    let gridSize = 10
    
    var found = 0
    
    init () {
        let firstChar = searchWord[searchWord.startIndex] // 'H'
        let secondChar = searchWord[searchWord.index(searchWord.startIndex, offsetBy: 1)] // 'o'
        let thirdChar = searchWord[searchWord.index(searchWord.startIndex, offsetBy: 2)] // 'o'
        let fourthChar = searchWord[searchWord.index(searchWord.startIndex, offsetBy: 3)] // 'o'

        sequence = [String(firstChar),
                    String(secondChar),
                    String(thirdChar),
                    String(fourthChar)]
    }
    

}
