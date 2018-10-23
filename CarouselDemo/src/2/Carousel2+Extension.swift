

import UIKit
/**
 * Event handler
 */
extension Carousel2{
   /**
    *
    */
   func onDown(_ point:CGPoint){
      Swift.print("onDown \(point)")
      self.downX = point.x
   }
   /**
    *
    */
   func onUp(_ point:CGPoint){
      Swift.print("onUp \(point)")
   }
   /**
    *
    */
   func onMove(_ point:CGPoint){
      Swift.print("onMove \(point)")
      let newX = cardContainer.frame.origin.x + (point.x - self.downX)
      self.downX = point.x//we reset downX, so we dont have to store cardContainer.x as well
      Swift.print("newX:  \(newX)")
      moveContainer(x: newX)
   }
}
/**
 * Utility
 */
extension Carousel2{
   /**
    *
    */
   func moveContainer(x:CGFloat){
      let fraction:CGFloat = -(x/UIScreen.main.bounds.width)
      let idx:Int = Int(floor(fraction))
      Swift.print("idx:  \(idx)")
      cardContainer.frame.origin.x = x//newX
      
      if self.idx != idx {
         Swift.print("idx has shifted to: \(idx), rearrange cards")
         if idx > self.idx {/*idx moved forward (slides moved right to left)*/
            Swift.print("idx moved forward")
            Swift.swap(&firstCard, &lastCard)
            firstCard.idx = idx
            lastCard.idx = idx + 1
         }else{/*idx moved backward (slides moved left to right)*/
            Swift.print("idx moved backward")
            Swift.swap(&firstCard, &lastCard)
            firstCard.idx = idx
            lastCard.idx = idx + 1
         }
         self.idx = idx
      }
      
      let normalizedX:CGFloat = x.truncatingRemainder(dividingBy: UIScreen.main.bounds.width)
      firstCard.frame.origin.x = normalizedX <= 0 ? normalizedX : -UIScreen.main.bounds.width + normalizedX
      lastCard.frame.origin.x = firstCard.frame.origin.x + UIScreen.main.bounds.width
   }
}
/**
 * Create
 */
extension Carousel2{
   func createCardContainer() -> UIView{
      // let rect:CGRect = .init(size:CGSize(width:self.frame.width*8height:self.frame.height),origin:.zero)
      let cardContainer = UIView.init(frame:self.frame)
      addSubview(cardContainer)
      (-4..<4).indices.forEach{ i in
         let origin = CGPoint(x:0,y:0)
         let size = CGSize(width: self.frame.size.width,height: self.frame.size.height)
         let rect = CGRect(origin:origin,size:size)
         let color:UIColor = Int(i) % 2 == 0 ? .green : .orange
         let card = DebugCard.init(color:color, idx:i, frame:rect)
         card.frame.origin.x = CGFloat(i) * self.frame.size.width
         cardContainer.addSubview(card)
      }
      return cardContainer
      
   }
   /**
    * Creates first card
    */
   func createFirst(idx:Int) -> Card2{
      let card = createCard(idx: idx)
      card.frame.origin.x = 0
      return card
   }
   /**
    * Creates second card
    */
   func createSecond(idx:Int) -> Card2{
      let card = createCard(idx: idx)
      card.frame.origin.x = UIScreen.main.bounds.width
      return card
   }
   /**
    * Creates card
    */
   private func createCard(idx:Int) -> Card2{
      let card = Card2.init(color: self.items[idx],idx: idx,  frame: UIScreen.main.bounds)
      self.addSubview(card)
      card.isUserInteractionEnabled = false
      return card
   }
}
