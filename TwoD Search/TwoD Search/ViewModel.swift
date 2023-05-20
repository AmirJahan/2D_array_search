import SwiftUI


class ViewModel: ObservableObject
{
    @Published
    var arr: [[Letter]] = []
        
    init ()
    {
        // populate the array with a static series of random characters
        // static -> won't change each time the UI updates
        arr = (0..<AppData.inst.gridSize).map { _ in
            (0..<AppData.inst.gridSize).map { _ in Letter() }
        }
        
        
        // manually place the first instance
        arr[0][4].letter = "r"
        arr[1][4].letter = "a"
        arr[2][4].letter = "f"
        arr[3][4].letter = "a"
        
        
        
        // manually place the second instance
        arr[4][6].letter = "r"
        arr[5][6].letter = "a"
        arr[6][6].letter = "f"
        arr[7][6].letter = "a"
        
        
        
        // manually place a partial instance
        arr[2][8].letter = "r"
        arr[3][8].letter = "a"
        arr[5][8].letter = "a"
    }
}
