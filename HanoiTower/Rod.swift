import Foundation

class Rod {
    var disks: [Int]
    
    init(disksAmount: Int) {
        self.disks = Rod.fillRod(disksAmount: disksAmount)
    }
    
    private static func fillRod(disksAmount: Int) -> [Int] {
        var rod: [Int] = []
        if disksAmount == 0 {
            return rod
        }
        for disk in 1...disksAmount {
            rod.append(disk)
        }
        return rod
    }
}
