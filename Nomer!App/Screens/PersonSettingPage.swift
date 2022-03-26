import SwiftUI

struct PersonSettingPage: View {
    var name = "Maxmudov Ilyos"
    var email = "maxmudovilyos57@gmail.com"
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                HStack{
                    Image("MyPhoto")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(50)
                        .padding()
                    
                    VStack(alignment: .leading){
                        Text(name)
                            .fontWeight(.black)
                            .font(.system(size: 17))
                            .padding(.bottom, 5)
                        
                        Text(email).font(.system(size: 15))
                    }
                }
                .padding()
                
                ScrollView(showsIndicators: false){
                    NavigationLink(destination: { MyProfilePage() }, label: {
                        PersonMenu(image: "person", colors: "MyProfile", title: "My profile")
                    })
                    NavigationLink(destination: {}, label: {
                        PersonMenu(image: "gearshape", colors: "Setting", title: "Setting")
                    })
                    NavigationLink(destination: {}, label: {
                        PersonMenu(image: "repeat", colors: "history", title: "Transsactions history")
                    })
                    NavigationLink(destination: {}, label: {
                        PersonMenu(image: "bell", colors: "Notifactions", title: "Notifications")
                    })
                    NavigationLink(destination: {}, label: {
                        PersonMenu(image: "questionmark.circle", colors: "FAQs", title: "FAQs")
                    })
                }
                .padding(.top)
                .padding(.bottom)
                
                HStack{
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "chevron.forward.square")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 20))
                            Text("Sign out")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 20))
                        }
                    }).padding(7)
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.blue,lineWidth: 2))
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        ZStack{
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color.pink.opacity(0.4))
                            
                            Image(systemName: "ellipsis.bubble")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color.black)
                        }
                    })
                    .padding()
                }
                
            }
        }
    }
}

struct PersonSettingPage_Previews: PreviewProvider {
    static var previews: some View {
        PersonSettingPage()
.previewInterfaceOrientation(.portrait)
    }
}
