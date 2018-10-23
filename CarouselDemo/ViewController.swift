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
      self.view.isUserInteractionEnabled = true
      _ = carousel2
//      let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
////      tap.minimumPressDuration = 0
//      Swift.print("tap.delaysTouchesBegan:  \(tap.delaysTouchesBegan)")
//      view.addGestureRecognizer(tap)
      
//      let tap = UILongPressGestureRecognizer(target: self, action: #selector(onTap))
//      tap.minimumPressDuration = 0
//      view.addGestureRecognizer(tap)

   }
   @objc func onTap(sender: UILongPressGestureRecognizer) {
//      Swift.print("onTap \(sender.state.rawValue)")
      if sender.state == .began {
         Swift.print("onTap().down")
         
         
      } else if [.ended,.cancelled,.failed].contains(sender.state) {// if  {/*on tap release*/
         //         onNormal(self)
         //         Swift.print("onTap().release\(sender.state.rawValue)")
         
      }else if sender.state == .changed {
//         Swift.print("changed")
      }
   }
   override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/

}
