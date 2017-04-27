import UIKit

class HanoiViewController: UIViewController {
    
    @IBOutlet weak var hanoiView: HanoiView!
    
    var hanoiTower: HanoiTower!
    private let alertTitle = "Wow! Finish!"
    private let alertMessage = "Try again"
    private let alertActionTitle = "OK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hanoiTower.gotMovingDisks = drawRodsWithDisks
        hanoiTower.stopMovingDisks = finish
        hanoiTower.start()
    }
    
    private func drawRodsWithDisks(firstRod: Rod, secondRod: Rod, thirdRod: Rod) {
        hanoiView.setRods(firstRod: firstRod, secondRod: secondRod, thirdRod: thirdRod)
        hanoiView.setNeedsDisplay()
    }
    
    private func finish() {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: {
            action in
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController")
            self.present(startViewController!, animated: true, completion: nil)
            }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
