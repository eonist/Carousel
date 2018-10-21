import UIKit

extension Carousel {
   /**
    *
    */
//   func animate(){
//      let anim = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
//         //onUpdate
//      })
//      anim.addCompletion{_ in /*onComplete()*/ }
//      anim.startAnimation()
//   }
}

//Animation
extension Carousel {
   static let defaultDur:TimeInterval = 0.8
   /**
    * Animates cards fróm right to left
    */
   func animateLeft(){
      self.curX =  self.curX -   self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width ) - UIScreen.main.bounds.width
      anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
         Swift.print("self.curX:  \(self.curX)")
//         Swift.print("self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width):  \(self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width))")
         
         Swift.print("self.curX:  \(self.curX)")
         self.moveCards(x: self.curX)
//         self.firstCard.frame.origin.x = -UIScreen.main.bounds.width
//         self.secondCard.frame.origin.x = 0
      })
      anim?.startAnimation()
//      anim.pause()
//      let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
//      //let dur:CGFloat = defaultDuration * (1-curProgress)//durLeft
//      anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
   }
   /**
    * Animates cards fróm left to right
    * NOTE: Moves cards from left to right
    */
   func animateRight(){
      self.curX = self.curX - self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width) + UIScreen.main.bounds.width
      anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
         
//         self.firstCard.frame.origin.x = 0
//         self.secondCard.frame.origin.x = UIScreen.main.bounds.width
         self.moveCards(x: self.curX)
      })
      anim?.startAnimation()
//      anim.pause()
//      let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
//      anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
   }
   /**
    * Animates cards to idle position
    * NOTE: basically when the gesture is dropped within left and right boundry
    */
   func animateToIdle(beyondLeft:Bool){
      anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
         
         self.curX = self.curX - self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width)
         self.moveCards(x: self.curX)
//         if beyondLeft {
//            Swift.print("beyond left")
//            self.firstCard.frame.origin.x = 0
//            self.secondCard.frame.origin.x = UIScreen.main.bounds.width
//         }else {
//            Swift.print("beyond right")
//            self.firstCard.frame.origin.x = -UIScreen.main.bounds.width
//            self.secondCard.frame.origin.x = 0
//         }
      })
      anim?.startAnimation()
//      anim.pause()
//      let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
//      anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
   }
}
