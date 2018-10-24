import UIKit

class CardView:UIView, CardKind, ConstraintKind{
   /*Stores the constraints, for easy activating and deactivating*/
   var size:SizeConstraint?
   var anchor:AnchorConstraint?
   /*UI*/
   lazy var backgroundLayer:CALayer = createBackgroundLayer()
   lazy var maskLayer:CAShapeLayer = createMaskLayer()
   lazy var topBar:TopBar = createTopBar()
   lazy var cardContent:MiddleContent = createMiddleContent()
   lazy var bottomBar:BottomBar = createBottomBar()
   var idx: Int  {
      didSet{//after
//         textField.text = "Idx: \(idx)"
         let color:UIColor = Carousel.items[IntParser.normalize(idx, Carousel.items.count)]
         cardContent.backgroundColor = color
      }
   }
   init(idx:Int, frame:CGRect) {
      self.idx = idx
      super.init(frame: frame)
      _ = backgroundLayer
      _ = maskLayer
      _ = topBar
      _ = cardContent
      let color:UIColor = Carousel.items[IntParser.normalize(idx, Carousel.items.count)]
      cardContent.backgroundColor = color
      _ = bottomBar
//      _ = textField
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
