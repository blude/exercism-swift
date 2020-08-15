enum CircularBufferError: Error {
    case bufferEmpty, bufferFull
}

struct CircularBuffer<S> {
    private var buffer: ContiguousArray<S> = []
    let capacity: Int
    
    init(capacity: Int) {
        guard capacity > 0 else {
            fatalError("Invalid capacity: \(capacity)")
        }
        self.capacity = capacity
    }

    mutating func read() throws -> S {
        guard !buffer.isEmpty else {
            throw CircularBufferError.bufferEmpty
        }
        return buffer.removeFirst()
    }
    
    mutating func write(_ value: S) throws {
        guard buffer.count < capacity else {
            throw CircularBufferError.bufferFull
        }
        buffer.append(value)
    }
    
    mutating func overwrite(_ value: S) {
        if buffer.count < capacity {
            try? write(value)
        } else {
            buffer.removeFirst()
            buffer.append(value)
        }
    }
    
    mutating func clear() {
        buffer = []
    }

}
