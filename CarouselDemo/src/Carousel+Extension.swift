import UIKit

extension Carousel{
   /**
    *
    */
   func createGrayBox() -> UIView{
      let view:UIView = .init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
      view.backgroundColor = .gray
      addSubview(view)
      return view
      
   }
   /**
    *
    */
   func createRedBox() -> UIView{
      let view:UIView = .init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/2))
      view.backgroundColor = .red
      addSubview(view)
      return view
   }

}
extension Carousel{
   /**
    * Adds gesture recognizers
    */
   func addGestureHandler(){
      Swift.print("addGestureHandler")
      /*Tap*/
      let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
      self.addGestureRecognizer(tap)
      /*Pan*/
      let pan = UIPanGestureRecognizer(target:self, action:#selector(onPan))
      self.addGestureRecognizer(pan)
   }
}
extension Carousel{
   /**
    * Normal tap
    */
   @objc func onTap(sender : UITapGestureRecognizer) {
      Swift.print("handleTap")
      if [.ended,.cancelled,.failed].contains(sender.state) {/*on tap release*/
         //onTapRelease()
         Swift.print("onTapRelease()")
      }
   }
   /**
    * When user drags a tap across the screen
    */
   @objc func onPan(recognizer:UIPanGestureRecognizer) {
      let translation = recognizer.translation(in: self)
      Swift.print("translation:  \(translation)")
//      guard let posConstraint = curView.anchor else {fatalError("err posConstraint not available")}
//      let x = posConstraint.x.constant + translation.x
//      curView.update(offset: x, align: .left, alignTo: .left)
      redBox.frame.origin.x = redBox.frame.origin.x + translation.x
      /**/
      recognizer.setTranslation(.zero, in: self)/*reset recognizer*/
      if [.ended,.cancelled,.failed].contains(recognizer.state)   {
         onTapRelease()/*call tapRelease*/
      }
   }
   /**
    * When user release tap (regular tap, or drag tap)
    */
   private func onTapRelease(){
      Swift.print("onTapRelease()")
      let screenRect = UIScreen.main.bounds
      var leftBoundry:CGFloat {return screenRect.origin.x - screenRect.size.width/4 }
      var rightBoundry:CGFloat {return screenRect.size.width + screenRect.size.width/4 }
      //self.view.isUserInteractionEnabled = false/*disable userinteractions, while animation is playing*/
      if redBox.frame.origin.x < leftBoundry {/*more 25% to the left*/
         //beyondLeft()
         Swift.print("beyondLeft")
      }else if (redBox.frame.origin.x + redBox.frame.width) > rightBoundry {/*more than 25% to the right*/
         //beyondRight()
         Swift.print("beyondRight")
      }else {/*released within boundries*/
         //withinBoundry()
         Swift.print("withinBoundry")
      }
      //self.layoutIfNeeded()/*visual update*/
   }
}
//      if redBox.x > threshold {
//         //shuffle cards around, move leftcard to right card
//         animateRight()
//      }else if redBox.x < -threshold {
//         //shuffle cards around, move right card to left card
//         animateLeft()
//      }else{
//         //do shuffle cards around
//         animateToIdle()
//      }
//
////Listeners
//extension Carousel{
//   /**
//    * Adds gestureHandlers
//    */
//   func addGestureHandler() {
//      grayBox.onPress = onGrayBoxPress
//      grayBox.onRelease = onGrayBoxRelease
//      grayBox.onDrag = onGrayBoxDrag
//   }
//}
////Handlers
//extension Carousel{
//   func onGrayBoxPress() {
//      //
//      self.grayBoxPressXPos = touch.position.x
//      animation.stop()
//   }
//   func onGrayBoxRelease() {
//      if redBox.x > threshold {
//         //shuffle cards around, move leftcard to right card
//         animateRight()
//      }else if redBox.x < -threshold {
//         //shuffle cards around, move right card to left card
//         animateLeft()
//      }else{
//         //do shuffle cards around
//         animateToIdle()
//      }
//   }
//   /**
//    * NOTE: DISCUSSION: We don't use .fractionComplete because we want to handle scrubbing our selfs, actually lets use .fractionComplete, we can add friction to fractioncomplete as well. not that hard, fractioncomplete is greate for getting progress later, the more we use Apples api, the better
//    * NOTE: ⚠️️ actually we cant use fractionCoplete, because we dont know the release animation before we release.
//    */
//   func onGrayBoxDrag() {
//      let offset:CGFloat = touch.position.x - self.grayBoxPressXPos
//      redBox.x = offset
//
//      if (offset > 0) {
//         //shuffle cards around, move right card to left card
//      }else if offset < 0 {
//         //shuffle cards around, move leftcard to right card
//      }else {
//         //do shuffle cards around
//      }
//   }
//}
////Animation
//extension Carousel {
//   static let defaultDur:CGFloat = 0.3
//   /**
//    * Animates cards fróm right to left
//    */
//   func animateLeft(){
//      let anim = UIViewPropertyAnimator(duration: defaultDur, curve: .easeOut, animations: {
//         redBox.frame.x = UIScreen.main.width
//      })
//      anim.start()
//      anim.pause()
//      let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
//      //let dur:CGFloat = defaultDuration * (1-curProgress)//durLeft
//      anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
//   }
//   /**
//    * Animates cards fróm left to right
//    */
//   func animateRight(){
//      let anim = UIViewPropertyAnimator(duration: defaultDur, curve: .easeOut, animations: {
//         redBox.frame.x = -UIScreen.main.width
//      })
//      anim.start()
//      anim.pause()
//      let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
//      anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
//   }
//   /**
//    * Animates cards to idle position
//    */
//   func animateToIdle(){
//      let anim = UIViewPropertyAnimator(duration: defaultDur, curve: .easeOut, animations: {
//         redBox.frame.x = 0
//      })
//      anim.start()
//      anim.pause()
//      let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
//      anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
//   }
//}
