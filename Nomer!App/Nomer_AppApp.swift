import SwiftUI

@main
struct Nomer_AppApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            FirstPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
extension UIScene {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}
