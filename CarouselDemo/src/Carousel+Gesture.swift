import UIKit

/**
 * Add gestures
 */
extension Carousel:UIGestureRecognizerDelegate{
   /**
    * Makes longPress and pan work in tandem
    */
   func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
      return true
   }
   /**
    * Adds gesture recognizers
    */
   func addGestureHandler(){
      Swift.print("addGestureHandler")
      /*Tap*/
      let tap = UILongPressGestureRecognizer(target: self, action: #selector(onTap))
      tap.minimumPressDuration = 0.0
      addGestureRecognizer(tap)
      
      /*Pan*/
      let pan = UIPanGestureRecognizer(target:self, action:#selector(onPan))
      pan.delegate = self
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
   @objc func onTap(sender: UILongPressGestureRecognizer) {
      if sender.state == .began {
         Swift.print("onTap().down")
         Swift.print("curX:  \(curX)")
         Swift.print("prevX:  \(prevX)")
      } else if [.ended,.cancelled,.failed].contains(sender.state) {// if  {/*on tap release*/
//         onNormal(self)
//         Swift.print("onTap().release\(sender.state.rawValue)")
         onTapRelease()
      }
   }
   /**
    * When user drags a tap across the screen
    */
   @objc func onPan(recognizer:UIPanGestureRecognizer) {
//      Swift.print("onPan")
//      if let anim = self.anim, anim.isRunning {
//         anim.pauseAnimation()
//         anim.stopAnimation(true)
//      }
      
      let translation = recognizer.translation(in: self)
      //      Swift.print("translation:  \(translation)")
      //      guard let posConstraint = curView.anchor else {fatalError("err posConstraint not available")}
      //      let x = posConstraint.x.constant + translation.x
      //      curView.update(offset: x, align: .left, alignTo: .left)
      curX += translation.x
//      redBox.frame.origin.x = curX
      reArrange(x: curX)
      //      Swift.print("curX:  \(curX)")
      
      recognizer.setTranslation(.zero, in: self)/*reset recognizer*/
      if [.ended,.cancelled,.failed].contains(recognizer.state)   {
//         Swift.print("onPan.onTapRelease: \(recognizer.state.rawValue)")
//         onTapRelease()/*call tapRelease*/
      }
   }
   /**
    * When user release tap (regular tap, or drag tap)
    */
   private func onTapRelease(){
      Swift.print("onTapRelease() 👌")
//      return
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
//      Swift.print("idx:  \(idx)")
      if self.idx != idx {
         Swift.print("idx has shifted to: \(idx), rearrange cards")
         
         if idx > self.idx {//idx moved forward (slides moved right to left)
            Swift.print("idx moved forward")
            firstCard.disappeared()
            Swift.swap(&firstCard, &secondCard)
            firstCard.idx = idx
            firstCard.appeared()
            secondCard.idx = idx + 1
            secondCard.appeared()
         }else{//idx moved backward (slides moved left to right)
            Swift.print("idx moved backward")
            secondCard.disappeared()
            Swift.swap(&firstCard, &secondCard)
            firstCard.idx = idx 
            firstCard.appeared()
            secondCard.idx = idx + 1
            secondCard.appeared()
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
   /**
    * Just move the first card, and align the second to the first
    */
   func moveCards2(toX:CGFloat){
      firstCard.frame.origin.x = toX
      secondCard.frame.origin.x = firstCard.frame.origin.x + UIScreen.main.bounds.width
   }
}
