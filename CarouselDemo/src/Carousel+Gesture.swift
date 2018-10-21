import UIKit

/**
 * Add gestures
 */
extension Carousel/*:UIGestureRecognizerDelegate*/{
   /**
    * Adds gesture recognizers
    */
   func addGestureHandler(){
      Swift.print("addGestureHandler")
      /*Tap*/
//      self.isUserInteractionEnabled = true
      let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
      tap.delegate = self as? UIGestureRecognizerDelegate
//       tap.
//      let touchDown = UILongPressGestureRecognizer(target:self, action: #selector(onTap))
//      touchDown.minimumPressDuration = 0
//      self.addGestureRecognizer(touchDown)
      /*Pan*/
      let pan = UIPanGestureRecognizer(target:self, action:#selector(onPan))
      self.addGestureRecognizer(pan)
   }
}
/**
 * Handle gestures
 */
extension Carousel{
   /**
    * Normal tap
    */
   @objc func onTap(sender : UITapGestureRecognizer) {
      Swift.print("onTap()")
      Swift.print("curX:  \(curX)")
      Swift.print("prevX:  \(prevX)")
//
      
      if [.ended,.cancelled,.failed].contains(sender.state) {/*on tap release*/
//         onTapRelease()
         
      }
   }
   /**
    * When user drags a tap across the screen
    */
   @objc func onPan(recognizer:UIPanGestureRecognizer) {
      if let anim = self.anim, anim.isRunning {
         anim.pauseAnimation()
         anim.stopAnimation(true)
      }
      
      let translation = recognizer.translation(in: self)
      //      Swift.print("translation:  \(translation)")
      //      guard let posConstraint = curView.anchor else {fatalError("err posConstraint not available")}
      //      let x = posConstraint.x.constant + translation.x
      //      curView.update(offset: x, align: .left, alignTo: .left)
      curX += translation.x
//      redBox.frame.origin.x = curX
      reArrange(x: curX)
      //      Swift.print("curX:  \(curX)")
      
      
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
//      let screenRect = UIScreen.main.bounds
//      var leftBoundry:CGFloat {return screenRect.origin.x - screenRect.size.width/4 }
//      var rightBoundry:CGFloat {return screenRect.size.width + screenRect.size.width/4 }
      //self.view.isUserInteractionEnabled = false/*disable userinteractions, while animation is playing*/
//      let normalizedX:CGFloat = curX.truncatingRemainder(dividingBy: UIScreen.main.bounds.width)
//      Swift.print("onTapRelease.normalizedX:  \(normalizedX)")
      let dist:CGFloat = curX - prevX
      Swift.print("curX:  \(curX)")
      Swift.print("prevX:  \(prevX)")
      Swift.print("dist:  \(dist)")
      let normalizedDist = (dist.truncatingRemainder(dividingBy: UIScreen.main.bounds.width))
      if abs(normalizedDist) > UIScreen.main.bounds.width/4 {
         if dist < 0 {/*more 25% to the left*/
            Swift.print("animateLeft")
            animateLeft()//beyondLeft
         }else {/*if dist > 0*/ /*more than 25% to the right*/
            Swift.print("animateRight")
            animateRight()//beyondRight
         }
      }else {/*released within boundries*/
         Swift.print("animateToIdle")
         animateToIdle(beyondLeft: normalizedDist <= 0)
      }
      prevX = curX
      //self.layoutIfNeeded()/*visual update*/
   }
}
/**
 * ReArranger
 * NOTE: The rearangers job is to keep track of idx, call apeared, and disapeared, and set carouselState on items
 * NOTE: slots are rearanged at onScroll
 */
extension Carousel{
   /**
    * PARAM x: the current offset of the virtualBox
    */
   func reArrange(x:CGFloat){
      
      let fraction:CGFloat = -(x/UIScreen.main.bounds.width)
      let idx:Int = Int(floor(fraction))
      Swift.print("idx:  \(idx)")
      if self.idx != idx {
         Swift.print("idx has shifted to: \(idx), rearrange cards")
         if idx > self.idx {//idx moved forward (slides moved right to left)
            Swift.print("idx moved forward")
            firstCard.disappeared()
            secondCard.appeared()
            Swift.swap(&firstCard, &secondCard)
         }else{//idx moved backward (slides moved left to right)
            Swift.print("idx moved backward")
            secondCard.disappeared()
            firstCard.appeared()
            Swift.swap(&firstCard, &secondCard)
         }
         self.idx = idx
      }
      
      //the bellow is wrong, you need to
         //see if it works with out animation 👈
         //
      moveCards(x: x)
      
   }
   /**
    *
    */
   func moveCards(x:CGFloat){
      let normalizedX:CGFloat = x.truncatingRemainder(dividingBy: UIScreen.main.bounds.width)
      firstCard.frame.origin.x = normalizedX <= 0 ? normalizedX : -UIScreen.main.bounds.width + normalizedX
      secondCard.frame.origin.x = firstCard.frame.origin.x + UIScreen.main.bounds.width
   }
}
