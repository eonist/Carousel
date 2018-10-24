import UIKit

/**
 * Create
 */
extension Carousel2{
   /**
    * Creates first card
    */
   func createFirst(idx:Int) -> Card2{
      let card = createCard(idx: idx)
//      card.frame.origin.x = 0
      setCardConstraints(card, xOffset: 0)
      return card
   }
   /**
    * Creates second card
    */
   func createSecond(idx:Int) -> Card2{
      let card = createCard(idx: idx)
      setCardConstraints(card, xOffset: UIScreen.main.bounds.width)
//      card.frame.origin.x = UIScreen.main.bounds.width
      return card
   }
   /**
    * Creates card
    */
   private func createCard(idx:Int) -> Card2{
      let card = Card2.init(color: Carousel2.items[idx],idx: idx, frame: UIScreen.main.bounds)
      self.addSubview(card)
      card.isUserInteractionEnabled = false//⚠️️ needed?
      return card
   }
   /**
    * Align card
    */
   func setCardConstraints(_ card:Card2,xOffset:CGFloat){
      let screenSize:CGSize = {
         let size = UIScreen.main.bounds.size
         return CGSize(width:size.width, height:size.height)
      }()
      card.setAndActivateConstraint{ view in
         let size:SizeConstraint = Constraint.size(card, size: screenSize)
         let anchor:AnchorConstraint = Constraint.anchor(card, to: self, align: .topLeft, alignTo: .topLeft, offset:CGPoint(x:xOffset,y:0))
         return (anchor:anchor, size:size)
      }
   }
}
