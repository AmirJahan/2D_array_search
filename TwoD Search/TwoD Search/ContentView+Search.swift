import SwiftUI


extension ContentView
{
    func searchLetter(atRow row: Int, column: Int)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
        {
            testLetter(row, column, AppData.inst.sequence[0]) { res in
                // here we begin
            }
                        
            var nextRow = row
            var nextColumn = column + 1
            if nextColumn == AppData.inst.gridSize { nextColumn = 0; nextRow = row + 1 }
            if nextRow == AppData.inst.gridSize { return }
            
            if nextRow < AppData.inst.gridSize && nextColumn < AppData.inst.gridSize {
                searchLetter(atRow: nextRow, column: nextColumn)
            }
        }
    }
    
    func testLetter (_ r: Int, _ c: Int, _ l: String,
                     _ digIn: Bool = true, completion: @escaping (Bool) -> Void)
    {
        if r >= AppData.inst.gridSize || c >= AppData.inst.gridSize { return }
        
        // remember what's the current color of the cell
        let curCol = vm.arr[r][c].col
        
        vm.arr[r][c].col = .orange
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
        {
            if vm.arr[r][c].letter == l // first letter was good
            {
                vm.arr[r][c].col = .blue
                
                // if digIn is true, we will try to run three more times to match the other characters
                if digIn
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3)
                    {
                        testLetter(r + 1, c, AppData.inst.sequence[1], false) { res in
                            
                            if res // second letter was good
                            {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
                                {
                                    testLetter(r + 2, c, AppData.inst.sequence[2], false) { res in
                                        if res // third letter was good
                                        {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
                                            {
                                                testLetter(r + 3, c, AppData.inst.sequence[3], false) { res in
                                                    if res // fourth letter was good
                                                    {
                                                        AppData.inst.found += 1
                                                        searchResTxt = "Found \(AppData.inst.found) instances"
                                                        for i in 0..<AppData.inst.sequence.count
                                                        {
                                                            vm.arr[r+i][c].col = .green
                                                        }
                                                    }
                                                    else
                                                    {
                                                        
                                                    }
                                                }
                                            }
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                }
                
                
                completion (true)
            }
            else
            {
                // go back to cur color. If it was found before, keep it blue
                vm.arr[r][c].col = curCol
                completion (false)
            }
        }
    }
}

