import Foundation

class HanoiTower {
    private let disksAmount: Int
    private(set) var firstRod: Rod
    private(set) var secondRod: Rod
    private(set) var thirdRod: Rod
    private var step = 0
    private var timer = Timer()
    private let timeInterval: TimeInterval = 1
    private var moveDisk: () -> () = {return}
    var gotMovingDisks: (Rod, Rod, Rod) -> () = {firstRod, secondRod, thirdRod in return}
    var stopMovingDisks: () -> () = {return}
    
    init(disksAmount: Int) {
        self.disksAmount = disksAmount
        self.firstRod = Rod(disksAmount: disksAmount)
        self.secondRod = Rod(disksAmount: 0)
        self.thirdRod = Rod(disksAmount: 0)
        if disksAmount % 2 == 0 {
            moveDisk = moveDiskForEvenAmount
        } else {
            moveDisk = moveDiskForOddAmount
        }
    }
    
    func start() {
        gotMovingDisks(firstRod, secondRod, thirdRod)
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector:  #selector(replaceDisks), userInfo: nil, repeats: true)
    }
    
    @objc private func replaceDisks() {
        
        if !allHaveMoved() {
            moveDisk()
        } else {
            timer.invalidate()
            stopMovingDisks()
            return
        }
    }
    
    private func allHaveMoved() -> Bool {
        return secondRod.disks.count == disksAmount || thirdRod.disks.count == disksAmount
    }
    
    private func moveDiskForEvenAmount() {
        switch step {
        case 0:
            moveDisk(one: firstRod, another: thirdRod)
            gotMovingDisks(firstRod, secondRod, thirdRod)
            step += 1
        case 1:
            moveDisk(one: firstRod, another: secondRod)
            gotMovingDisks(firstRod, secondRod, thirdRod)
            step += 1
        case 2:
            moveDisk(one: secondRod, another: thirdRod)
            gotMovingDisks(firstRod, secondRod, thirdRod)
            step = 0
        default: return
        }
    }
    
    private func moveDiskForOddAmount() {
        switch step {
        case 0:
            moveDisk(one: firstRod, another: secondRod)
            gotMovingDisks(firstRod, secondRod, thirdRod)
            step += 1
        case 1:
            moveDisk(one: firstRod, another: thirdRod)
            gotMovingDisks(firstRod, secondRod, thirdRod)
            step += 1
        case 2:
            moveDisk(one: secondRod, another: thirdRod)
            gotMovingDisks(firstRod, secondRod, thirdRod)
            step = 0
        default: return
        }
    }
    
    private func moveDisk(one: Rod, another: Rod) {
        if one.disks.isEmpty && another.disks.isEmpty {
            print("nothing to move")
            return
        }
        
        if another.disks.isEmpty {
            another.disks.insert(one.disks[0], at: 0)
            one.disks.remove(at: 0)
            return
        }
        
        if one.disks.isEmpty {
            one.disks.insert(another.disks[0], at: 0)
            another.disks.remove(at: 0)
            return
        }
        
        if one.disks[0] < another.disks[0] {
            another.disks.insert(one.disks[0], at: 0)
            one.disks.remove(at: 0)
        } else {
            one.disks.insert(another.disks[0], at: 0)
            another.disks.remove(at: 0)
        }
    }
}
