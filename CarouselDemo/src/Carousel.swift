import UIKit

//get rid of container ✅
//add the remainder code to set the correct color, see IntParser.loop for quick memory jog ✅
//Add Spatial ✅
//add the nice design ✅
//add easing methods from Animator 👈
//add text elements 👈 👈
//Make CarouselCard overridable , test with WeatherCard, use generics
//Try to add Carousel as .framework to weatherApp
//Add carousel to weatherApp as carthage once it works
//Add spatial to carousel as .framework
//add spatial to carousel as carthage
//add spatial to weatherapp as carthage
//See if it all works
//get TravisCI to work with building carthage

class Carousel:UIView,UIGestureRecognizerDelegate{//⚠️️ cardView should be T,U:CardKind where U :UIView etc
   static let items:[UIColor] = [.yellow,.blue,.green,.red]//⚠️️ TODO: make this generic instead T, make sure that works with overriding
   /*UI*/
   lazy var firstCard:CardView = self.createFirst(idx: 0)
   lazy var lastCard:CardView = self.createSecond(idx: 1)
//   lazy var cardContainer:UIView = createCardContainer()
   /*Interim*/
   var containerX:CGFloat = 0/*Virtual X value of cardContainer*/
   var downX:CGFloat = 0
   var downContainerX:CGFloat = 0
   var idx:Int = 0
   /*Animation*/
   lazy var animator:CarouselAnimator = CarouselAnimator(duration:Carousel.defaultDur)
//   var downIdx:Int = 0
	override init(frame:CGRect){
		super.init(frame:frame)
      self.backgroundColor = .gray
      self.isUserInteractionEnabled = true
//      _ = cardContainer
      _ = firstCard
      _ = lastCard
//      addGestures()
	}
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   /**
    * On tap down inside
    */
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//      Swift.print("touchesBegan")
      if  let touch = touches.first/*, touch.view == self*/ {
         let touchPoint = touch.location(in: self)
         onDown(touchPoint)
      }
      super.touchesBegan(touches, with:event)
   }
   /**
    * On tap up inside
    */
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//      Swift.print("touchesEnded")
      if  let touch = touches.first/*, touch.view == self*/ {
         let touchPoint = touch.location(in: self)
         onUp(touchPoint)
      }
      super.touchesEnded(touches, with:event)
   }
   override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch = touches.first /*, touch.view == self*/ {
         let touchPoint = touch.location(in: self)
         onMove(touchPoint)
      }
      super.touchesMoved(touches, with: event)
   }
}
//class DebugCard:UIView{
//   var color:UIColor
//   var idx:Int
//   lazy var textField:UITextField = {
//      let textField = UITextField.init(frame: self.frame)
//      textField.text = "Idx: \(idx)"
//      addSubview(textField)
//      textField.textColor = .black
//      textField.textAlignment = .center
//      textField.font = .boldSystemFont(ofSize: 16)
//      textField.isUserInteractionEnabled = false
//      return textField
//   }()
//   init(color:UIColor, idx:Int, frame: CGRect) {
//      self.color = color
//      self.idx = idx
//      super.init(frame: frame)
//      backgroundColor = self.color
//      _ = textField
//   }
//   required init?(coder aDecoder: NSCoder) {
//      fatalError("init(coder:) has not been implemented")
//   }
//   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//      super.touchesBegan(touches, with:event)
//      next?.touchesBegan(touches, with: event)
//   }
//   /**
//    * On tap up inside
//    */
//   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//      if let touch = touches.first, touch.view == self{
//         Swift.print("Touch ended")
//      }
//      super.touchesEnded(touches, with:event)
//   }
//}
