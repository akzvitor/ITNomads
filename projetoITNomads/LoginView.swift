import SwiftUI

struct LoginView: View {

@State var username: String = ""
@State var password: String = ""

var body: some View {
    NavigationStack{
        ZStack {
            // gradiente de fundo
            LinearGradient(gradient: Gradient(colors: [.white, .teal]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("ITNomads")
                    .font(.title)
                    .foregroundColor(.teal)
                    .bold()
                
                Spacer()
                    .frame(height: 70)
                
                TextField("Nome de usuário", text: $username)
                    .onChange(of: username) { newValue in
                        username = newValue.lowercased()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                
                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                // Botão Entrar
                NavigationLink(destination: MainTabbedView(userName: username)){
                    Text("Enter")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.teal)
                .cornerRadius(15.0)
                
                
            }
            .frame(maxWidth: 500)  // Limite a largura dos campos de texto
            .padding(.horizontal)  // Adicionar espaço horizontal ao redor dos campos de texto
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)  // Centralizar na tela
    }
}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
