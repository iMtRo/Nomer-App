import SwiftUI


struct LoginIn: View {
    
    @State var email = ""
    @State var password = ""
    @State var emailField = true
    @State var passwordField = true
    
    var body: some View {
        
        VStack {
            Text("Sign In")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color .black)
                .kerning(3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack{
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
                
                // Forget Password
                Button(action: {}, label: {
                    Text("Forget Password ?")
                        .fontWeight(.bold)
                        .foregroundColor(Color .black)
                })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 10)
                
            }.padding()
            
            
            // Next Button
            Button(action: {}, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color .white)
                    .padding()
                    .background(Color .black)
                    .clipShape(Circle())
                // Shadow
                    .shadow(color: Color.blue.opacity(0.6), radius: 25, x: 0, y: 0)
            })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            
        }
        .padding()
    }
}

struct LoginIn_Previews: PreviewProvider {
    static var previews: some View {
        LoginIn()
    }
}
