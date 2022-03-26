import SwiftUI

struct Home: View {
    
    @State var maxCircleHeight: CGFloat = 0
    @State var showSignUp = false
    
    var body: some View {
        
        VStack {
             
            GeometryReader{ proxy -> AnyView in
                
                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if maxCircleHeight == 0 {
                        maxCircleHeight = height
                    }
                }
                
                 return AnyView (
                    ZStack{
                        Circle()
                           .fill(Color("dark"))
                           .offset(x: getRect().width / 2, y: -height / 1.3)
                        
                        Circle()
                           .fill(Color("dark"))
                           .offset(x: -getRect().width / 2, y: -height / 1.5)
                        
                         Circle()
                            .fill(Color("blue"))
                            .offset(y: -height / 1.3)
                            .rotationEffect(.init(degrees: -5))
                    }
                    
                 )
            }
            .frame(maxHeight: getRect().width)
            
            
            
            VStack{
                // Transitions.....
                
                if showSignUp{
                    SignUp()
                        .transition(.move(edge: .trailing))
                }
                else{
                    LoginIn()
                        .transition(.move(edge: .trailing))
                }
                
            }
            .padding(.top, -maxCircleHeight / (getRect().height < 750 ? 1.5 : 1.6) )
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .overlay(
            HStack{
                Text(showSignUp ? "Already Member" : "New Member")
                    .fontWeight(.bold)
                    .foregroundColor(Color .black)
                
                Button(action: {
                    withAnimation{
                        showSignUp.toggle()
                    }
                }, label: {
                    Text(showSignUp ? "Sign In" : "Sign Up")
                        .fontWeight(.black)
                        .foregroundColor(Color("blue"))
                        .font(.system(size: 20))
                        
                })
            }
                .padding(.bottom, getSafeArea().bottom == 0 ? 15 : 0)
            ,alignment: .bottom
        )
        .background(
            // Bottom Rings
            HStack {
                Circle()
                    .fill(Color("blue"))
                    .frame(width: 75, height: 75)
                    .offset(x: -30, y: getRect().height  < 750 ? 10 : 0)
                Spacer(minLength: 0)
                
                Circle()
                    .fill(Color("dark"))
                    .frame(width: 110, height: 110)
                    .offset(x: 40, y: 20)
            }
            .offset(y: getSafeArea().bottom + 30)
            ,alignment: .bottom
        )
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    
    func getRect() -> CGRect{
        
        return UIScreen.main.bounds
    }
    
    // Getting Safe area...
    func getSafeArea() -> UIEdgeInsets{
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

