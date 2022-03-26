import SwiftUI

struct PersonMenu: View {
    
    @State var image = "person"
    @State var colors = "MyProfile"
    @State var title = "My Profile"
    
    var body: some View {
        
        HStack{
            
            ZStack{
                Circle()
                    .foregroundColor(Color("\(colors)"))
                    .frame(width: 50, height: 50)
                
                Image(systemName: "\(image)")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: 35, height: 35)
                    .cornerRadius(50)
                    .padding()
            }.overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.blue,lineWidth: 2))
            
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 25))
                .foregroundColor(Color.black)
                .padding()
        }.padding(5)
        
    }
}

struct PersonMenu_Previews: PreviewProvider {
    static var previews: some View {
        PersonMenu()
    }
}
