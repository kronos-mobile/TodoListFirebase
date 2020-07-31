import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    var id = ""
    private var cancellables = Set<AnyCancellable>()
    @Published var task: Task
    @Published var completionStateIconName = ""
    
    init(task: Task) {
        self.task = task
        
        $task.map { task in
            task.completed ? "checkmark.circle.fill" : "circle"
        }.assign(to: \.completionStateIconName, on: self)
        .store(in: &cancellables)
        
        $task.map { task in
            task.id
        }.assign(to: \.id, on: self)
        .store(in: &cancellables)
    
    }
    
}
