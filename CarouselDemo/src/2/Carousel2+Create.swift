

import UIKit

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
