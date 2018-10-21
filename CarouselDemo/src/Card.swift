import UIKit

class Card:Item{
   var color:UIColor
   
   init(color:UIColor, idx:Int, frame: CGRect) {
      self.color = color
      super.init(idx:idx, frame: frame)
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

