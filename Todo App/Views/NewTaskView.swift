//
//  NewTaskView.swift
//  Todo App
//
//  Created by Eli Hartnett on 12/4/21.
//

import SwiftUI

struct NewTaskView: View {
    
    @Environment(\.managedObjectContext) var context
    @State var title: String = ""
    @State var info: String = ""
    @Binding var NewTaskViewIsActive: Bool
    
    var body: some View {
        VStack {
            TaskView(title: $title, info: $info)
            
            Button {
                let task = Task(context: context)
                task.title = title
                task.info = info
                try! context.save()
                NewTaskViewIsActive = false
            } label: {
                Text("Create")
            }
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(NewTaskViewIsActive: .constant(true))
    }
}
