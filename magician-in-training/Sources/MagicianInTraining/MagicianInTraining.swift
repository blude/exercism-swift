import Foundation


func getCard(at index: Int, from stack: [Int]) -> Int {
    return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    var newStack = stack
    guard index >= 0, index < stack.endIndex else { return stack }
    newStack[index] = newCard
    return newStack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
    return stack + [newCard]
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    guard index >= 0, index < stack.endIndex, !stack.isEmpty else { return stack }
    var copy = stack
    copy.remove(at: index)
    return copy
}

func removeTopCard(_ stack: [Int]) -> [Int] {
    return removeCard(at: stack.endIndex - 1, from: stack)
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
    return [newCard] + stack
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
    return removeCard(at: 0, from: stack)
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
    return stack.count == size
}

func evenCardCount(_ stack: [Int]) -> Int {
    let evenCards = stack.filter { $0 % 2 == 0 }
    return evenCards.count
}
