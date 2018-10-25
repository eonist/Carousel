import UIKit
/**
 * Alignment
 */
extension Carousel{
   /**
    * Align card
    */
   func setCardConstraints(_ card:T,xOffset:CGFloat){//⚠️️ TODO: make generic
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
