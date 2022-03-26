import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomePage(info: Student())
                .tabItem{
                    Label("", systemImage: "house")
                }
            
            SearchPage()
                .tabItem{
                    Label("", systemImage: "magnifyingglass")
                }
            
            StaticPage()
                .tabItem{
                    Label("", systemImage: "chart.xyaxis.line")
                }
            
            PersonSettingPage()
                .tabItem{
                    Label("", systemImage: "person")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
