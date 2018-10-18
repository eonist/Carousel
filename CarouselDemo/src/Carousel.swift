import UIKit

//Make github repo, add pseudo code
//Disable the code that isn't needed for testing gestures 👈
//look at the legacy code, and how you position left right idle etc.
//create 4 views. with the 4 debug colors


class Carousel:UIView{
	//grayBox
	lazy var grayBox = createGrayBox()//cover entire screen
	lazy var redBox = createRedBox()//w:screen.width,h:screen.width
	//
	var grayBoxPressXPos:CGFloat = 0
	init(frame:CGRect){
		super.init(frame:frame)
		_ = grayBox
		_ = redBox
		addGestureHandler()
	}
}
//Listeners
extension Carousel{
	/**
    * Adds gestureHandlers
    */
	func addGestureHandler() {
		grayBox.onPress = onGrayBoxPress
		grayBox.onRelease = onGrayBoxRelease
		grayBox.onDrag = onGrayBoxDrag
	}
}
//Handlers
extension Carousel{
	func onGrayBoxPress() {
	    //
		self.grayBoxPressXPos = touch.position.x
		animation.stop()
	}
	func onGrayBoxRelease() {
    	if redBox.x > threshold {
			//shuffle cards around, move leftcard to right card
			animateRight()
		}else if redBox.x < -threshold {
			//shuffle cards around, move right card to left card
			animateLeft()
		}else{
			//do shuffle cards around
			animateToIdle()
		}
	}
	/**
    * NOTE: DISCUSSION: We don't use .fractionComplete because we want to handle scrubbing our selfs, actually lets use .fractionComplete, we can add friction to fractioncomplete as well. not that hard, fractioncomplete is greate for getting progress later, the more we use Apples api, the better
	 * NOTE: ⚠️️ actually we cant use fractionCoplete, because we dont know the release animation before we release.
    */
	func onGrayBoxDrag() {
		let offset:CGFloat = touch.position.x - self.grayBoxPressXPos
		redBox.x = offset

		if (offset > 0) {
			//shuffle cards around, move right card to left card
		}else if offset < 0 {
			//shuffle cards around, move leftcard to right card
		}else {
			//do shuffle cards around
		}
	}
}
//Animation
extension Carousel {
	static let defaultDur:CGFloat = 0.3
	/**
    * Animates cards fróm right to left
    */
	func animateLeft(){
		let anim = UIViewPropertyAnimator(duration: defaultDur, curve: .easeOut, animations: {
         redBox.frame.x = UIScreen.main.width
      })
		anim.start()
		anim.pause()
		let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
		//let dur:CGFloat = defaultDuration * (1-curProgress)//durLeft
		anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
	}
	/**
    * Animates cards fróm left to right
    */
	func animateRight(){
		let anim = UIViewPropertyAnimator(duration: defaultDur, curve: .easeOut, animations: {
         redBox.frame.x = -UIScreen.main.width
      })
		anim.start()
		anim.pause()
		let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
		anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
	}
	/**
    * Animates cards to idle position
    */
	func animateToIdle(){
		let anim = UIViewPropertyAnimator(duration: defaultDur, curve: .easeOut, animations: {
			redBox.frame.x = 0
		})
		anim.start()
		anim.pause()
		let curProgress:CGFloat = redBox.frame.x / UIDevice.main.size.width//0-1
		anim.continueAnimation(withTimingParameters parameters: .nil,  durationFactor: (1-curProgress))
	}
}
