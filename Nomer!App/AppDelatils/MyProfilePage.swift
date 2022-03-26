import SwiftUI

struct MyProfilePage: View {
    
    var info: Student
    
    //@Environment(\.presentationMode) var presentation
    //@Environment(\.managedObjectContext) var moc
    
//    @State var name: String = info.name ?? ""
//    @State var email: String = info.email ?? ""
//    @State var password: String = info.password ?? ""
//    @State var phone: String = info.phone ?? ""
//    @State var gender = info.gender ?? true
//    @State private var wakeUp = info.date!
    
//    func saveInfo(name:String, gender:Bool, phone:String, email:String){
//        let info = Student(context: self.moc)
//        info.name = name
//        info.phone = phone
//        info.email = email
//        info.gender = gender
//        try? self.moc.save()
//    }
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image("MyPhoto")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(15)
                    .frame(width: 200, height: 200)
                
                Button(action: {}, label: {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.white.opacity(0.8))
                        .padding(7)
                })
            }.padding()
            
            ScrollView{
                
                VStack{
                    
                    // Person Name
                    VStack(alignment: .leading){
                        
                        Text("Your name")
                            .fontWeight(.black)
                        
                        TextEditor(text: info.name?)
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    }.padding(.bottom)
                    
                    // Date of birth
                    VStack(alignment: .leading){
                        
                        Text("Date of birth")
                            .fontWeight(.black)
                        
                        DatePicker("Date of Birth", selection: info.date ?? .now, displayedComponents: .date)
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    }.padding(.bottom)
                    
                    // Gender
                    VStack(alignment: .leading){
                        
                        Text("Gender")
                            .fontWeight(.black)
                        
                        HStack{
                            Button(action: {}, label: {
                                HStack{
                                    info.gender ? Image(systemName: "circle.fill") : Image(systemName: "circle")
                                    
                                    Text("Male")
                                        .fontWeight(.black)
                                        .foregroundColor(Color.black)
                                }
                            })
                                .frame(width: UIScene.width / 3)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                            
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                HStack{
                                    info.gender ? Image(systemName: "circle") : Image(systemName: "circle.fill")
                                    
                                    Text("Female")
                                        .fontWeight(.black)
                                        .foregroundColor(Color.black)
                                }
                            })
                                .frame(width: UIScene.width / 3)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                        }
                    }.padding(.bottom)
                    
                    // Email
                    VStack(alignment: .leading){
                        
                        Text("Email")
                            .fontWeight(.black)
                        
                        TextEditor(text: info.email ?? "")
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    }.padding(.bottom)
                    
                    // Password
                    VStack(alignment: .leading){
                        
                        Text("Password")
                            .fontWeight(.black)
                        
                        TextEditor(text: info.password ?? "")
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    }.padding(.bottom)
                    
                    // Phone Number
                    VStack(alignment: .leading){
                        
                        Text("Phone number")
                            .fontWeight(.black)
                        
                        TextEditor(text: info.phone ?? "")
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    }.padding(.bottom)
                    
                }.padding()
                
            }
        }
        .navigationBarTitle("Personal data", displayMode: .inline)
        .navigationBarItems(trailing:
        Button(action: {
//            saveInfo(name: name, gender: gender, phone: phone, email: email)
//            presentation.wrappedValue.dismiss()
        }, label: {
            Text("Save")
                .padding(7)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
        }))
    }
}

struct MyProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        MyProfilePage(info: Student())
    }
}
