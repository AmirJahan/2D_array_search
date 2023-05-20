import SwiftUI


// This struct replaces a simple "Char"
// becuase we need to be change the background color of it and
// keep that color

struct Letter: Hashable, Identifiable
{
    let id = UUID()
    var letter = String(AppData.inst.letters.randomElement()!)
    var col = Color.gray
}
