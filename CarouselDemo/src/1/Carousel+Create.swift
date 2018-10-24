

import UIKit

/**
 * Create
 */
extension Carousel{
   /**
    * Debug
    */
   func createGrayBox() -> UIView{
      let view:UIView = .init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
      view.backgroundColor = .gray
      addSubview(view)
      return view
      
   }
   /**
    * Debug
    */
//   func createRedBox() -> UIView{
//      let view:UIView = .init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/2))
//      view.backgroundColor = .red
//      addSubview(view)
//      return view
//   }
   /**
    * Creates first card
    */
   func createFirst(idx:Int) -> Card{
      let card = createCard(idx: idx)
      card.frame.origin.x = 0
      return card
   }
   /**
    * Creates second card
    */
   func createSecond(idx:Int) -> Card{
      let card = createCard(idx: idx)
      card.frame.origin.x = UIScreen.main.bounds.width
      return card
   }
   /**
    * Creates card
    */
   private func createCard(idx:Int) -> Card{
      let card = Card.init(color: self.items[idx],idx: idx,  frame: UIScreen.main.bounds)
      self.addSubview(card)
      return card
   }
}
