//
//  ContentView.swift
//  ListViewApp
//
//  Created by 茶谷美咲 on 2020/09/06.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var nList = namesList()
    
    @ObservedObject var tList = TaskList()
    
    @State var newTask : String = ""
    
    var addTaskBar : some View{
        HStack{
            TextField("追加してください",text: self.$newTask)
            Button(action:self.addNewTask, label: {Text("add")})
//          ボタンを押した時の処理
        }
    }
    
    func addNewTask() {
        tList.tasks.append(Task(id: String(tList.tasks.count + 1), taskItem: newTask))
        self.newTask = ""
    }
    
    var body: some View {
        
        NavigationView {
            VStack{
                addTaskBar.padding()
                List {
                    ForEach(self.tList.tasks){
                        Index in Text(Index.taskItem)
                    }
                    .onDelete(perform: removeRows)
                    
                }
                .navigationBarItems(leading: EditButton())
                .navigationBarTitle("Taskリスト")
            }
            
        }

            
    }
    
    func removeRows(at offsets: IndexSet) {
    self.tList.tasks.remove(atOffsets: offsets)
}

    struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
    }
}
