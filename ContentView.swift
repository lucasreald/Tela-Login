//  Created by Lucas Real Dias on 23/03/23.

import SwiftUI

struct ContentView: View {

    @State var loginName = ""
    @State var password = ""
    @State  var rememberMe = false
    @AppStorage ("storage") var storage = ""
    @State var showWelcomeSheet = false
    @State var showAlertWrongPassword = false
    @State var showPasswordSheet = false
    @State var recLogin = ""
    @State var recEmail = ""
    @State var showAlertRecuperate = false
    @State var showNewAccountSheet = false
    @State var newName = ""
    @State var newEmail = ""
    @State var confirmNewEmail = ""
    @State var newPassword = ""
    @State var confirmNewPassword = ""
    @State var showNewAccountConfirmationAlert = false
    
    var body: some View {
        
            VStack{
                Text("NationX")
                    .font(.system(size: 50).weight(.light))
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 40)
                    .foregroundColor(Color("color1"))
                
                Form{
                    TextField(
                        "Login",
                        text: $loginName,
                        prompt: Text("Login")
                    )
                    .padding(10)
                    .font(.system(size: 30))
                    .autocorrectionDisabled()
                    SecureField(
                        "Password",
                        text: $password,
                        prompt: Text("Senha")
                    )
                    .padding(10)
                    .font(.system(size: 30))
                    
                    HStack{
                        
                        Text("Lembrar de mim")
                            .foregroundColor(Color("color1").opacity(0.6))
                        
                        Toggle("", isOn: $rememberMe)
                            .onChange(of: rememberMe){ value in
                                if rememberMe{
                                    save()
                                }
                            }
                            .onAppear{
                                loginName = storage
                            }
                            .tint(Color("color1"))
                    }
                    
                    Button("Login"){
                        if loginName == "Lucasreald" && password == "12345" {
                            showWelcomeSheet.toggle()
                        } else {
                            showAlertWrongPassword.toggle()
                        }
                    }
                    .alert("Senha Inválida", isPresented: $showAlertWrongPassword){
                    }
                    .sheet(isPresented: $showWelcomeSheet){
                       
                        Button(action: {showWelcomeSheet.toggle()}) {
                            Image(systemName: "arrowshape.turn.up.backward.fill")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .foregroundColor(Color("color1"))
                        .font(.system(size: 35))
                        Spacer()
                        
                        Text("Bem Vindo")
                            .foregroundColor(.gray)
                            .font(.system(size: 90).weight(.ultraLight))
                            .frame(maxWidth: 300, alignment: .leading)
                            .lineLimit(2)
                        Spacer()
                        
                        ZStack{
                            Image(systemName: "shield.righthalf.filled")
                                .font(.system(size: 200))
                            Text(loginName)
                                .foregroundColor(Color("color1"))
                                .font(.custom("Helvetica Neue", size: 40))
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 7)
                    .foregroundColor(Color("color2"))
                    .font(.system(size: 20).weight(.semibold))
                    .background(Color("color1"))
                    .cornerRadius(10)
                    .padding(20)
                  
                    Group{
                        Button("Recuperar senha"){
                            showPasswordSheet.toggle()
                        }
                        .sheet(isPresented: $showPasswordSheet){
                           
                            Button(action: {showPasswordSheet.toggle()}) {
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                            }
                            .foregroundColor(Color("color1"))
                            .font(.system(size: 35))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                           
                            Text("Insira suas informações")
                                .font(.system(size: 60))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(Color("color1"))
                                .fontWeight(.ultraLight)
                          
                            Form{
                                TextField(
                                    "Recuperate Login",
                                    text: $recLogin,
                                    prompt: Text("Login")
                                )
                                .padding(20)
                                TextField(
                                    "Recuperate Email",
                                    text: $recEmail,
                                    prompt: Text("Email")
                                )
                                .padding(20)
                                Button("Recuperar"){
                                    showAlertRecuperate.toggle()
                                }
                                .alert("Sucesso", isPresented: $showAlertRecuperate){
                                           
                                    Button("Ok"){
                                                showPasswordSheet.toggle()
                                            }
                                        } message: {
                                            Text("Em breve você receberá um email para redefinir sua senha.")
                                        }
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 7)
                                .foregroundColor(Color("color2"))
                                .font(.system(size: 20).weight(.semibold))
                                .background(Color("color1"))
                                .cornerRadius(10)
                                .padding(20)
                            }
                        }
                      
                        Button("Nova conta"){
                            showNewAccountSheet.toggle()
                        }
                        .sheet(isPresented: $showNewAccountSheet){
                           
                            Button(action: {showNewAccountSheet.toggle()}) {
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                            }
                            .foregroundColor(Color("color1"))
                            .font(.system(size: 35))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                           
                            Text("Cadastre-se")
                                .font(.system(size: 60))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(Color("color1"))
                                .fontWeight(.ultraLight)
                            
                            Form{
                                TextField(
                                "Name",
                                text: $newName,
                                prompt: Text("Nome")
                                )
                                .padding(17)
                                TextField(
                                 "Email",
                                 text: $newEmail,
                                 prompt: Text("Email")
                                )
                                .padding(17)
                                TextField(
                                 "Confirm Email",
                                 text: $confirmNewEmail,
                                 prompt: Text("Confirmar email")
                                )
                                .padding(17)
                                SecureField(
                                 "New Password",
                                 text: $newPassword,
                                 prompt: Text("Senha")
                                )
                                .padding(17)
                                SecureField(
                                 "Confirm Password",
                                 text: $confirmNewPassword,
                                 prompt: Text("Confirmar senha")
                                )
                                .padding(17)
                                Button("Cria Conta"){
                                    showNewAccountConfirmationAlert.toggle()
                                }
                                .alert("Sucesso", isPresented: $showNewAccountConfirmationAlert){
                                            Button("Ok"){
                                                showNewAccountSheet.toggle()
                                            }
                                        } message: {
                                            Text("Bem vindo(a), agora você faz parte da Irmandade!")
                                        }
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 7)
                                .foregroundColor(Color("color2"))
                                .font(.system(size: 20).weight(.semibold))
                                .background(Color("color1"))
                                .cornerRadius(10)
                                .padding(20)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 15))
                    .foregroundColor(.black).opacity(0.7)
                }
                .padding(.top, -250)
            }
        }
}

extension ContentView {
    func save(){
        storage = loginName
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
