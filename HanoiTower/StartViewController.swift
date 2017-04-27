import UIKit

class StartViewController: UIViewController {
    
    private var amountOfDisks: Int = 0
    private let defaultButtonColor = UIColor(red: 207/255.0, green: 208/255.0, blue: 212/255.0, alpha: 0.5)
    
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeToDefaultButtonColor()
    }
    
    @IBAction func diskButtonPressed(_ sender: UIButton) {
        changeToDefaultButtonColor()
        sender.backgroundColor = UIColor.lightGray
        amountOfDisks = sender.tag
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHanoiTower" {
            let toViewController: HanoiViewController = segue.destination as! HanoiViewController
            toViewController.hanoiTower = HanoiTower(disksAmount: amountOfDisks)
        }
    }
    
    private func changeToDefaultButtonColor() {
        twoButton.backgroundColor = defaultButtonColor
        threeButton.backgroundColor = defaultButtonColor
        fourButton.backgroundColor = defaultButtonColor
        fiveButton.backgroundColor = defaultButtonColor
        sixButton.backgroundColor = defaultButtonColor
        sevenButton.backgroundColor = defaultButtonColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
