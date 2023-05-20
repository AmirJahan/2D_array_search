import SwiftUI

struct ContentView: View
{
    @StateObject
    var vm = ViewModel()
    
    @State
    var searchResTxt = "Begin Search"
    
    let space: CGFloat = 1
    
    var columns : [GridItem] {
        return Array(repeating: .init(.flexible(),
                                      spacing: space),
                     count: AppData.inst.gridSize)
    }
    
    
    let screenH = UIScreen.main.bounds.size.height - 50
    
    var colHeight: CGFloat {
        return (screenH - CGFloat((AppData.inst.gridSize - 1)) * space ) / CGFloat(AppData.inst.gridSize)
    }
    
    var body: some View
    {
        VStack(spacing: 20)
        {
            HStack (spacing: 20)
            {

                VStack (alignment: .leading)                {
                    
                    
                    Text ("Searching for")
                        .font(.title)
                        .padding(.leading)
                    Text (AppData.inst.searchWord)
                        .font(.largeTitle)
                        .padding(.bottom)
                        .padding(.leading)

                    
                    Button ("Search")
                    {
                        // begin running search at 0, 0
                        searchLetter(atRow: 0, column: 0)
                        
                        searchResTxt = "Searching...."
                    }.foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(12)
                    
                    
                    Text (searchResTxt)
                    
                }
                Spacer()
                
                LazyVGrid (columns: columns,
                           spacing: space)
                {
                    ForEach(vm.arr, id: \.self) { r in
                        ForEach(r, id: \.self) { c in
                            Text(c.letter)
                                .font(.system(size: 16))
                                .frame(width: colHeight,
                                       height: colHeight)
                                .background(c.col)
                        }
                    }
                }
                .frame(width: screenH, height: screenH)
                .padding()
                
            }.padding()
            
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
            .previewDisplayName("iPad (10th generation)")
            .previewLayout(.device) // For landscape mode
            .previewInterfaceOrientation(.landscapeLeft) // Landscape orientation
        
    }
}
