import UIKit

//🏀
//get onTapDown working
//test making anim interuptable in seperate test, where u get curX after stop etc
//test with fake anim, just move directly a few times

class Carousel:UIView{
   let items:[UIColor] = [.green,.red,.yellow,.blue]
	//grayBox
//   lazy var grayBox:UIView = createGrayBox()//cover entire screen
//   lazy var redBox:UIView = createRedBox()//w:screen.width,h:screen.width
	//
//   var grayBoxPressXPos:CGFloat = 0
   var idx:Int = 0
   var curX:CGFloat = 0
   var prevX:CGFloat = 0
//   var prevX:CGFloat = 0

   lazy var firstCard:Card = self.createFirst(idx: 0)
   lazy var secondCard:Card = self.createSecond(idx: 1)
   
   var anim:UIViewPropertyAnimator?

   override init(frame:CGRect){
		super.init(frame:frame)
      isUserInteractionEnabled = true
      _ = firstCard
      _ = secondCard
//      _ = grayBox
//      _ = redBox

      backgroundColor = .purple
		addGestureHandler()
      
	}
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}





//      if redBox.x > threshold {
//         //shuffle cards around, move leftcard to right card
//         animateRight()
//      }else if redBox.x < -threshold {
//         //shuffle cards around, move right card to left card
//         animateLeft()
//      }else{
//         //do shuffle cards around
//         animateToIdle()
//      }
//
////Listeners
//extension Carousel{
//   /**
//    * Adds gestureHandlers
//    */
//   func addGestureHandler() {
//      grayBox.onPress = onGrayBoxPress
//      grayBox.onRelease = onGrayBoxRelease
//      grayBox.onDrag = onGrayBoxDrag
//   }
//}
////Handlers
//extension Carousel{
//   func onGrayBoxPress() {
//      //
//      self.grayBoxPressXPos = touch.position.x
//      animation.stop()
//   }
//   func onGrayBoxRelease() {
//      if redBox.x > threshold {
//         //shuffle cards around, move leftcard to right card
//         animateRight()
//      }else if redBox.x < -threshold {
//         //shuffle cards around, move right card to left card
//         animateLeft()
//      }else{
//         //do shuffle cards around
//         animateToIdle()
//      }
//   }
//   /**
//    * NOTE: DISCUSSION: We don't use .fractionComplete because we want to handle scrubbing our selfs, actually lets use .fractionComplete, we can add friction to fractioncomplete as well. not that hard, fractioncomplete is greate for getting progress later, the more we use Apples api, the better
//    * NOTE: ⚠️️ actually we cant use fractionCoplete, because we dont know the release animation before we release.
//    */
//   func onGrayBoxDrag() {
//      let offset:CGFloat = touch.position.x - self.grayBoxPressXPos
//      redBox.x = offset
//
//      if (offset > 0) {
//         //shuffle cards around, move right card to left card
//      }else if offset < 0 {
//         //shuffle cards around, move leftcard to right card
//      }else {
//         //do shuffle cards around
//      }
//   }
//}

