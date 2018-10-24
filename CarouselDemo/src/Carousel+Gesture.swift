import UIKit
/**
 * Gesture
 */
extension Carousel{
   /**
    * onDown
    */
   func onDown(_ point:CGPoint){
      Swift.print("onDown \(point)")
      animator.stop()
      self.downX = point.x
      //self.downIdx = idx
      self.downContainerX = containerX
   }
   /**
    * onUp
    */
   func onUp(_ point:CGPoint){
      Swift.print("onUp \(point.x) 👆")
      let remainder:CGFloat = containerX.remainder(dividingBy: UIScreen.main.bounds.width)//truncatingRemainder(dividingBy: )
//      Swift.print("remainder:  \(remainder)")
      let diff:CGFloat = containerX - downContainerX
//      Swift.print("diff:  \(diff)")
      if diff == 0{/*click without movment*/
         animator.from < animator.to ? animateLeft() : animateRight()//find direction of last anim, and start the similar anim
      }else if abs(remainder) > UIScreen.main.bounds.width/4 {
         if diff > 0 {
//            Swift.print("👉")
            animateLeft()
         }else if diff < 0 {
//            Swift.print("👈")
            animateRight()
         }
      }else{/*within threshold*/
//         Swift.print("👇")
         animateToIdle(isBeyondLeft: diff < 0)
      }
   }
   /**
    * onMove
    */
   func onMove(_ point:CGPoint){
      //    Swift.print("onMove \(point)")
      let newX = containerX + (point.x - self.downX)
      self.downX = point.x//we reset downX, so we dont have to store cardContainer.x as well
      //Swift.print("newX:  \(newX)")
      moveContainer(x: newX)
   }
}
/**
 * Utility
 */
extension Carousel{
   /**
    * moveContainer
    */
   func moveContainer(x:CGFloat){
      containerX = x//newX
      let fraction:CGFloat = -(x/UIScreen.main.bounds.width)
      let idx:Int = Int(floor(fraction))
      //Swift.print("idx:  \(idx)")
      if self.idx != idx {
         Swift.print("idx has shifted to: \(idx), rearrange cards")
         if idx > self.idx {/*idx moved forward (slides moved right to left)*/
            Swift.print("idx moved forward")
            Swift.swap(&firstCard, &lastCard)
            firstCard.idx = idx
            lastCard.idx = idx + 1//⚠️️ strictly speaking the +1 should be the diff of curIdx and idx, etc,etc, but only relevant if setIdx is implemented on the carousel
         }else{/*idx moved backward (slides moved left to right)*/
            Swift.print("idx moved backward")
            Swift.swap(&firstCard, &lastCard)
            firstCard.idx = idx
            lastCard.idx = idx + 1
         }
         self.idx = idx
      }
      let normalizedX:CGFloat = x.truncatingRemainder(dividingBy: UIScreen.main.bounds.width)//⚠️️ this should probably be .remainder(devidedBy: etc
      let firstX = normalizedX <= 0 ? normalizedX : -UIScreen.main.bounds.width + normalizedX
      firstCard.update(offset: firstX, align: .left, alignTo: .left)
      lastCard.update(offset: firstX + UIScreen.main.bounds.width, align: .left, alignTo: .left)
   }
}
