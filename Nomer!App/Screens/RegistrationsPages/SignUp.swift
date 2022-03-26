import SwiftUI
import CoreData

struct SignUp: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var phone: String = "+998"
    @State var gender = true
    @State private var wakeUp = Date.now
    
    @State var emailField = true
    @State var passwordField = true
    
    func saveInfo(name:String, gender:Bool, phone:String, email:String, date:Date){
        let info = Student(context: self.moc)
        info.name = name
        info.phone = phone
        info.email = email
        info.gender = gender
        info.date = wakeUp
        try? self.moc.save()
    }
    var body: some View {
        
        VStack {
            Text("Sign Up")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color .black)
                .kerning(3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            // Registration View
            ScrollView(showsIndicators: false){
                
                VStack{
                    
                    // Person Name
                    VStack(alignment: .leading){
                        
                        Text("Your name")
                            .fontWeight(.black)
                        
                        TextField("Your name", text: $name)
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    }.padding(.bottom)
                    
                    // Date of birth
                    VStack(alignment: .leading){
                        
                        Text("Date of birth")
                            .fontWeight(.black)
                        
                        DatePicker("Date of Birth", selection: $wakeUp, in: ...Date.now, displayedComponents: .date)
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    }.padding(.bottom)
                    
                    // Gender
                    VStack(alignment: .leading){
                        
                        Text("Gender")
                            .fontWeight(.black)
                        
                        HStack{
                            Button(action: {gender = true}, label: {
                                HStack{
                                    gender ? Image(systemName: "circle.fill") : Image(systemName: "circle")
                                    
                                    Text("Male")
                                        .fontWeight(.black)
                                        .foregroundColor(Color.black)
                                }
                            })
                                .frame(width: UIScene.width / 3)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                            
                            
                            Spacer()
                            
                            Button(action: {gender = false}, label: {
                                HStack{
                                    gender ? Image(systemName: "circle") : Image(systemName: "circle.fill")
                                    
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
                        
                        TextField("Email", text: $email)
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                        
                        if !emailField {
                            Text("The row is empty")
                                .foregroundColor(Color.red)
                                .fontWeight(.black)
                        }
                    }.padding(.bottom)
                    
                    // Password
                    VStack(alignment: .leading){
                        
                        Text("Password")
                            .fontWeight(.black)
                        
                        TextField("Password", text: $password)
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                        
                        if !passwordField {
                            Text("The row is empty")
                                .foregroundColor(Color.red)
                                .fontWeight(.black)
                        }
                    }.padding(.bottom)
                    
                    // Phone Number
                    VStack(alignment: .leading){
                        
                        Text("Phone number")
                            .fontWeight(.black)
                        
                        TextEditor(text: $phone)
                            .padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    }.padding(.bottom)
                    
                }.padding()
                
            }
            
            
            // Next Button
            Button(action: {
                
                saveInfo(name: name, gender: gender, phone: phone, email: email, date: wakeUp)
                presentation.wrappedValue.dismiss()
                
            }, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color .white)
                    .padding()
                    .background(Color .black)
                    .clipShape(Circle())
                // Shadow
                    .shadow(color: Color.blue .opacity(0.6), radius: 25, x: 0, y: 0)
            })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            
        }
        .padding()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

