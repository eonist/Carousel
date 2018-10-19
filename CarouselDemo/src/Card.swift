import UIKit

class Card:CarouselItem{
   var color:UIColor
   
   init(color:UIColor, frame: CGRect) {
      self.color = color
      super.init(frame: frame)
      backgroundColor = self.color
   }
   override func appeared() {
      //
   }
   override func disappeared() {
      //
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
