//
//  TaskView.swift
//  Todo App
//
//  Created by Eli Hartnett on 12/4/21.
//

import SwiftUI

struct TaskView: View {
    
    @State var task: Task?
    @Binding var title: String
    @Binding var info: String
    
    var body: some View {
        VStack {
            
            Text("Title")
                .bold()
            TextField("Title", text: $title, prompt: Text("Title"))
            
            Text("Description:")
                .bold()
            TextEditor(text: $info)
        }
        .padding(.horizontal)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        
        let task = Task()
        
        TaskView(task: task, title: .constant("Title here"), info: .constant("Description here"))
    }
}
