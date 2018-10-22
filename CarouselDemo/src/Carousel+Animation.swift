import UIKit

//Animation
extension Carousel {
   static let defaultDur:TimeInterval = 0.3
   /**
    * Animates cards fróm right to left
    */
   func animateLeft(){
      Swift.print("animateLeft 👌")
      let remainder = self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width )
      let from = self.curX
      Swift.print("from:  \(from)")
      let to =  self.curX - remainder - (remainder <= 0 ? UIScreen.main.bounds.width : 0)
      Swift.print("to:  \(to)")
      let animator = TimeAnimator(duration:0.3)
      animator.tick = {
         Swift.print("animator.curCount:  \(animator.curCount)")
         Swift.print("animator.progress:  \(animator.progress)")
         self.curX = TimeAnimator.Interpolate(from: from, to: to, fraction: animator.progress)
         self.reArrange(x: self.curX)
      }
      animator.start()
      
//      let anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
//
//      })
//      anim.startAnimation()
   }
   /**
    * Animates cards fróm left to right
    * NOTE: Moves cards from left to right
    */
   func animateRight(){
      Swift.print("animateRight 👌")
      let anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
         let remainder = self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width)
         self.curX = self.curX -  remainder + (remainder >= 0 ?  UIScreen.main.bounds.width : 0)
         self.reArrange(x: self.curX)
      })
      anim.startAnimation()
   }
   /**
    * Animates cards to idle position
    * NOTE: basically when the gesture is dropped within left and right boundry
    */
   func animateToIdle(beyondLeft:Bool){
      Swift.print("animateToIdle 👌")
      let anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
         if beyondLeft {
            self.curX = -(CGFloat(self.idx) * UIScreen.main.bounds.width)
         }else {
            self.curX = -(CGFloat(self.idx) * UIScreen.main.bounds.width) - UIScreen.main.bounds.width
         }
         self.reArrange(x: self.curX)
      })
      anim.startAnimation()
   }
}
