import UIKit

//Animation
extension Carousel {
   
   static let defaultDur:TimeInterval = 0.9
   /**
    * Animates cards fróm right to left
    */
   func animateLeft(){
      Swift.print("animateLeft 👌")
      let remainder = self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width )
      self.curX = self.curX - remainder - (remainder <= 0 ? UIScreen.main.bounds.width : 0) + 1
      anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
         self.reArrange(x: self.curX )
      })
      anim?.addCompletion {_ in
         self.reArrange(x: self.curX - 1)//this is a hack since, UIPropAnimator doesn't really interpolate values
      }
      anim?.startAnimation()
   }
   /**
    * Animates cards fróm left to right
    * NOTE: Moves cards from left to right
    */
   func animateRight(){
      Swift.print("animateRight 👌")
      anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
         let remainder = self.curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width)
         self.curX = self.curX -  remainder + (remainder >= 0 ?  UIScreen.main.bounds.width : 0)
         self.reArrange(x: self.curX)
      })
      anim?.startAnimation()
   }
   /**
    * Animates cards to idle position
    * NOTE: basically when the gesture is dropped within left and right boundry
    */
   func animateToIdle(beyondLeft:Bool){
      Swift.print("animateToIdle 👌")
      anim = UIViewPropertyAnimator(duration: Carousel.defaultDur, curve: .easeOut, animations: {
         if beyondLeft {
            self.curX = -(CGFloat(self.idx) * UIScreen.main.bounds.width)
         }else {
            self.curX = -(CGFloat(self.idx) * UIScreen.main.bounds.width) - UIScreen.main.bounds.width
         }
         self.reArrange(x: self.curX)
      })
      anim?.startAnimation()
   }
}
