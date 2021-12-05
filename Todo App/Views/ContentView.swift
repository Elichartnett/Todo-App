//
//  ContentView.swift
//  Todo App
//
//  Created by Eli Hartnett on 12/4/21.
//

import SwiftUI


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var tasks: FetchedResults<Task>
    @State var NewTaskViewIsActive = false
    @State var detailTaskSelection: Int?
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("To-do list")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink(isActive: $NewTaskViewIsActive) {
                        NewTaskView(NewTaskViewIsActive: $NewTaskViewIsActive)
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }

                }
                
                Divider()
                
                ForEach (tasks) { task in
                    
                    NavigationLink(tag: task.hashValue, selection: $detailTaskSelection) {
                        TaskDetailView(task: task, title: task.title ?? "", info: task.info ?? "", detailTaskSelection: $detailTaskSelection)
                    } label: {
                        Text(task.title!)
                            .padding(.top, 10.0)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 25.0)
            .foregroundColor(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
