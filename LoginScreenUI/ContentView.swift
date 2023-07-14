//
//  ContentView.swift
//  LoginScreenUI
//
//  Created by Nikhil Saini on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLogin = false
    @State private var showRegister = false
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color.blue
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(1.35)
                        .foregroundColor(.white)
                    
                    VStack {
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        
                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongUsername))
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongPassword))
                        
                        Button("Login") {
                           validate(username: username, password: password)
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                        
                        NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showLogin) {
                            EmptyView()
                        }
                        
                        
                        
                        
                        Button("Register") {
                             showRegister = true
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)

                        NavigationLink(destination: Text("View B"), isActive: $showRegister) { EmptyView() }
                       
                    }
                }
                .navigationBarHidden(true)
            }
            
    }
    func validate(username: String, password: String) {
        if username.lowercased() == "nik" {
            wrongUsername = 0
            if password.lowercased() == "nik123" {
                wrongPassword = 0
                showLogin = true
            }
            else {
                wrongPassword = 2
            }
        }
        else {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
