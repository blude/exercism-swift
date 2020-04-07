enum CircularBufferError: Error {
    case bufferEmpty, bufferFull
}

struct CircularBuffer<S> {
    var buffer: [S?]
    var readIndex = 0
    var writeIndex = 0
    
    init(capacity: Int) {
        self.buffer = [S?](repeating: nil, count: capacity)
    }

    mutating func clear() {
        for (index, _) in buffer.enumerated() {
            buffer[index] = nil
        }
    }
    
    mutating func read() throws -> S? {
        guard !isEmpty else {
            throw CircularBufferError.bufferEmpty
        }
        let element = buffer[readIndex % buffer.count]
        readIndex += 1
        return element
    }
    
    mutating func write(_ value: S) throws {
        guard !isFull else {
            throw CircularBufferError.bufferFull
        }
        buffer[writeIndex % buffer.count] = value
        writeIndex += 1
    }
    
    mutating func overwrite(_ value: S) {
        buffer[writeIndex % buffer.count] = value
        writeIndex += 1
    }
    
    fileprivate var spaceForReading: Int {
        writeIndex - readIndex
    }
    
    fileprivate var isEmpty: Bool {
        spaceForReading == 0
    }
    
    fileprivate var spaceForWriting: Int {
        buffer.count - spaceForReading
    }
    
    fileprivate var isFull: Bool {
        spaceForWriting == 0
    }
    
}
