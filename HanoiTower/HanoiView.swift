import UIKit

class HanoiView: UIView {
    
    private var firstRod = Rod(disksAmount: 0)
    private var secondRod = Rod(disksAmount: 0)
    private var thirdRod = Rod(disksAmount: 0)
    private let colorsForDisks: [UIColor] = [
        UIColor(red: 20/255.0, green: 154.0/255.0, blue: 53.0/255.0, alpha: 1.0),
        UIColor(red: 100/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0),
        UIColor(red: 255/255.0, green: 255.0/255.0, blue: 102.0/255.0, alpha: 1.0),
        UIColor(red: 255/255.0, green: 0/255.0, blue: 153/255.0, alpha: 1.0),
        UIColor(red: 0/255.0, green: 51/255.0, blue: 255/255.0, alpha: 1.0)
    ]
    private let rodColor = UIColor(red: 153/255.0, green: 153/255.0, blue: 153.0/255.0, alpha: 1.0)
    private let rodWidth:CGFloat = 5
    private let rodPadding: CGFloat = 20
    private var diskScale = 30
    private let diskWidth: CGFloat = 20
    
    func setRods(firstRod: Rod, secondRod: Rod, thirdRod: Rod) {
        self.firstRod = firstRod
        self.secondRod = secondRod
        self.thirdRod = thirdRod
    }
    
    override func draw(_ rect: CGRect) {
        
        drawRod(sector: .first)
        drawRod(sector: .second)
        drawRod(sector: .third)
        drawDisks(rod: firstRod, sector: .first)
        drawDisks(rod: secondRod, sector: .second)
        drawDisks(rod: thirdRod, sector: .third)
    }
    
    private func drawDisks(rod: Rod, sector: TypeOfSector) {
        if rod.disks.isEmpty {
            return
        }
        
        while CGFloat(diskScale * rod.disks.last!) > bounds.width/3 {
            diskScale -= 1
        }
        var amountOfDisks = rod.disks.count
        
        for disk in rod.disks {
            let diskPath = UIBezierPath()
            var numberOfColor = disk - 1
            while numberOfColor >= colorsForDisks.count {
                numberOfColor = numberOfColor - colorsForDisks.count
            }
            let color = colorsForDisks[numberOfColor]
            diskPath.move(to: CGPoint(x: bounds.width/3 * CGFloat(sector.hashValue) + bounds.width / 6 - CGFloat(disk * (diskScale/2)),
                                      y: bounds.height - CGFloat(amountOfDisks) * diskWidth + diskWidth/2))
            diskPath.addLine(to: CGPoint(x: bounds.width/3 * CGFloat(sector.hashValue) + bounds.width / 6 + CGFloat(disk * (diskScale/2)),
                                         y:bounds.height - CGFloat(amountOfDisks) * diskWidth + diskWidth/2))
            
            amountOfDisks -= 1
            color.setStroke()
            diskPath.lineWidth = diskWidth
            diskPath.stroke()
        }
    }
    
    private func drawRod(sector: TypeOfSector) {
        let rod = UIBezierPath()
        rod.move(to: CGPoint(x: bounds.width/3 * CGFloat(sector.hashValue) + bounds.width/6,
                             y: bounds.height))
        rod.addLine(to: CGPoint(x: bounds.width/3 * CGFloat(sector.hashValue) + bounds.width/6,
                                y: rodPadding))
        rodColor.setStroke()
        rod.lineWidth = rodWidth
        rod.stroke()
    }
}
