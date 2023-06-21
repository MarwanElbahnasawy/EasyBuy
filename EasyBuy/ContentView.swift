//
//  ContentView.swift
//  EasyBuy
//
//  Created by Marwan Elbahnasawy on 31/05/2023.
//

import SwiftUI
import CoreData
import Combine

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    //For Network checking
    @StateObject var networkReachability = NetworkReachability()
    @State private var showSnackbar = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var cancellable: AnyCancellable?
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
//            .onAppear(perform: {
//                NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CustomerAccessTokenCreateMutation(input: CustomerAccessTokenCreateInput(email: "marwan@gmail.com", password: "123456")), responseModel: CustomerAccessTokenCreateData.self, completion: { result in
//                    switch result {
//                    case .success(let response):
//                        if let token = response.customerAccessTokenCreate?.customerAccessToken {
//                            print("New customer created with ID: \(token.accessToken ?? "N/A")")
//                        } else if let errors = response.customerAccessTokenCreate?.customerAccessTokenError?.first?.message {
//                            print("Failed to create customer due to errors: \(errors)")
//                        }
//                    case .failure(let error):
//                        print("Failed to create customer due to error: \(error)")
//                    }
//                })
//            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }.navigationViewStyle(StackNavigationViewStyle())
        //For Network Connectivity
        .overlay(
            Group {
                if showSnackbar {
                    VStack {
                        Spacer()
                        Text("No internet connection")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            },
            alignment: .bottom
        )
        // For Network Connectivity
        .onReceive(timer) { _ in
            showSnackbar = !networkReachability.reachable
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
