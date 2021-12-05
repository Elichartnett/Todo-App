//
//  TaskDetailView.swift
//  Todo App
//
//  Created by Eli Hartnett on 12/4/21.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.managedObjectContext) var context
    @State var task: Task
    @State var title: String
    @State var info: String
    @Binding var detailTaskSelection: Int?
    
    var body: some View {
        VStack {
            TaskView(task: task, title: $title, info: $info)
            
            Button {
                task.title = title
                task.info = info
                try! context.save()
                detailTaskSelection = nil
            } label: {
                Text("Save")
            }
            
            Button {
                context.delete(task)
                try! context.save()
                detailTaskSelection = nil
            } label: {
                Text("Delete")
            }

        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(), title: "Title here", info: "Description here", detailTaskSelection: .constant(1))
    }
}
