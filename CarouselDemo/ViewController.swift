import UIKit

class ViewController: UIViewController {
   // lazy var carousel:Carousel = {
   //    let carousel = Carousel(frame: UIScreen.main.bounds)
   //    view.addSubview(carousel)
   //    return carousel
   // }()
   lazy var carousel2:Carousel2 = {
      let carousel = Carousel2(frame: UIScreen.main.bounds)
      view.addSubview(carousel)
      return carousel
   }()
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .gray
//      self.view.isUserInteractionEnabled = true
      _ = carousel2
   }
   override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
}
