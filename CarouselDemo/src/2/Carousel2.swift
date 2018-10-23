import UIKit


//So many edge cases ruines the code. Use TimeAnimator instead of UIPropAnimator, then try apples animator class
//Simpler: 🏀
   //add a CardContainer✅
      //make odd/even cards with idx to easier debug, -+10 ✅
   //onDown 👉 stopMoving cardContainer✅
   //onUp 👉 startMoving cardContainer✅
      //what dir is it moving 👈👈👈
      //what is the cur idx 👈👈👈
      //what is the next idx
      //animate to next idx, with the correct fraction of time
      //moveCardContainer(x:x) 👉✅
         //what is current idx?
         //modulo the X, and shuffle the 2 cards acordingly ()
         //we only move the CardContainer, not the cards directly.
   //onMoved 👉 move cardContainer✅
      //sort out card1 and card2

//then once the code is simple we ditch the cardcontainer for a virtual X value.
//Add TimeAnimator
   //stop the timeAnimator on onDown
      //start TimeAnimator with with correct dur: max_dur * dist_left_to_goal / max_dist
      //you find the dist to goal by looking at different .x .w vals in the beyondLeft,beyondRight,idle resolver
      //we also need to reset the TimeAnimator onDown or onUp
      
class Carousel2:UIView,UIGestureRecognizerDelegate{
   let items:[UIColor] = [.yellow,.blue,.green,.red]
   
   lazy var firstCard:Card2 = self.createFirst(idx: 0)
   lazy var lastCard:Card2 = self.createSecond(idx: 1)
   
   var idx:Int = 0
	lazy var cardContainer:UIView = createCardContainer()
   
   var downX:CGFloat = 0
	override init(frame:CGRect){
		super.init(frame:frame)
      self.backgroundColor = .purple
      self.isUserInteractionEnabled = true
      _ = cardContainer
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
//         Swift.print("Touch began \(touchPoint)")
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
//         Swift.print("Touch ended \(touchPoint)")
         onUp(touchPoint)
      }
      super.touchesEnded(touches, with:event)
   }
   override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch = touches.first /*, touch.view == self*/ {
         let touchPoint = touch.location(in: self)
//         Swift.print("Touch moved \(touchPoint)")
         onMove(touchPoint)
      }
      super.touchesMoved(touches, with: event)
   }
//   func addGestures() {
//      let tap = UILongPressGestureRecognizer(target: self, action: #selector(onTap))
//      tap.minimumPressDuration = 0
//      Swift.print("tap.delaysTouchesBegan:  \(tap.delaysTouchesBegan)")
//      tap.delegate = self
//      addGestureRecognizer(tap)
//   }
	/**
    * Normal tap
    */
//   @objc func onTap(sender: UILongPressGestureRecognizer) {
//      //      Swift.print("onTap \(sender.state.rawValue)")
//      if sender.state == .began {
//         Swift.print("onTap().down")
//
//
//      } else if [.ended,.cancelled,.failed].contains(sender.state) {// if  {/*on tap release*/
//         //         onNormal(self)
//         //         Swift.print("onTap().release\(sender.state.rawValue)")
//
//      }else if sender.state == .changed {
//         //         Swift.print("changed")
//      }
//   }
//   @objc func onTap(sender: UILongPressGestureRecognizer) {
//      Swift.print("onTap()")
//      if sender.state == .began {
//         Swift.print("onTap.down")
//      } else if [.ended,.cancelled,.failed].contains(sender.state) {// if  {/*on tap release*/
//        Swift.print("onTap.release\(sender.state.rawValue)")
//      }else if sender.state == .changed {
//         Swift.print("onTap.changed")
//      }
//   }
}
class DebugCard:UIView{
	var color:UIColor
   var idx:Int
   lazy var textField:UITextField = {
      let textField = UITextField.init(frame: self.frame)
      textField.text = "Idx: \(idx)"
      addSubview(textField)
      textField.textColor = .black
      textField.textAlignment = .center
      textField.font = .boldSystemFont(ofSize: 16)
      textField.isUserInteractionEnabled = false
      return textField
   }()
   init(color:UIColor, idx:Int, frame: CGRect) {
      self.color = color
      self.idx = idx
      super.init(frame: frame)
      backgroundColor = self.color
      _ = textField
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
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
}
