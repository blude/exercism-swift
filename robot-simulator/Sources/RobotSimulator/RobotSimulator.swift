enum BearingTypes {
    case north
    case south
    case east
    case west
}

enum InstructionTypes: String {
    case turnLeft = "L"
    case turnRight = "R"
    case advance = "A"
}

class SimulatedRobot {
    var bearing: BearingTypes?
    var coordinates = [0, 0]
    
    func at(x: Int, y: Int) {
        self.coordinates[0] = x
        self.coordinates[1] = y
    }
    
    func advance() {
        let amount = 1
        switch bearing {
        case .east:
            self.coordinates[0] += amount
        case .west:
            self.coordinates[0] -= amount
        case .north:
            self.coordinates[1] += amount
        case .south:
            self.coordinates[1] -= amount
        default:
            break
        }
    }
    
    func turnRight() {
        switch bearing {
        case .east:
            self.bearing = .south
        case .west:
            self.bearing = .north
        case .north:
            self.bearing = .east
        case .south:
            self.bearing = .west
        default:
            break
        }
    }
    
    func turnLeft() {
        switch bearing {
        case .east:
            self.bearing = .north
        case .west:
            self.bearing = .south
        case .north:
            self.bearing = .west
        case .south:
            self.bearing = .east
        default:
            break
        }
    }
    
    func orient(_ bearing: BearingTypes) {
        self.bearing = bearing
    }
    
    func instructions(_ instructions: String) -> [InstructionTypes] {
        var robotInstructions = [InstructionTypes]()
        
        for instruction in instructions {
            robotInstructions.append(InstructionTypes(rawValue: String(instruction))!)
        }
        
        return robotInstructions
    }
    
    func place(x: Int, y: Int, direction: BearingTypes) {
        self.at(x: x, y: y)
        self.orient(direction)
    }
    
    func evaluate(_ instructions: String) {
        for instruction in instructions {
            let robotInstruction = InstructionTypes(rawValue: String(instruction))
            
            switch robotInstruction {
            case .turnLeft:
                self.turnLeft()
            case .turnRight:
                self.turnRight()
            case .advance:
                self.advance()
            default:
                break
            }
        }
    }
}
