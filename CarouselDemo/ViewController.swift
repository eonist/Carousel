import UIKit

class ViewController: UIViewController {
   lazy var carousel:Carousel = {
      let carousel = Carousel(frame: UIScreen.main.bounds)
      view.addSubview(carousel)
      return carousel
   }()
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .gray
      _ = carousel
     
   }
   override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
   
}
