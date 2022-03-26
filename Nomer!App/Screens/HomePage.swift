import SwiftUI

struct HomePage: View {
    
    var info: Student
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        
        VStack{
            
        }
        
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(info: Student())
    }
}
