import UIKit

//Make github repo, add pseudo code ✅
//Disable the code that isn't needed for testing gestures ✅
   //make Carousel+Extension.swift ✅
//look at the legacy code, and how you position left right idle etc.
//create 4 views. with the 4 debug colors


class Carousel:UIView{
	//grayBox
   lazy var grayBox:UIView = createGrayBox()//cover entire screen
   lazy var redBox:UIView = createRedBox()//w:screen.width,h:screen.width
	//
	var grayBoxPressXPos:CGFloat = 0
   override init(frame:CGRect){
		super.init(frame:frame)
		_ = grayBox
		_ = redBox
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
