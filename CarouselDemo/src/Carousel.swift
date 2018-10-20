import UIKit

//Make github repo, add pseudo code ✅
//Disable the code that isn't needed for testing gestures ✅
   //make Carousel+Extension.swift ✅
//look at the legacy code, and how you position left right idle etc. ✅
//create 4 views. with the 4 debug colors ✅

//get the rgb vals for the cool colors
//make the createCards methods 👈
//when idx switches,
   //then on the basis of which dir the idx switch is going then call, apear, disapar on items 👈

class Carousel:UIView{
   let items:[UIColor] = [.green,.red,.yellow,.blue]
	//grayBox
   lazy var grayBox:UIView = createGrayBox()//cover entire screen
   lazy var redBox:UIView = createRedBox()//w:screen.width,h:screen.width
	//
	var grayBoxPressXPos:CGFloat = 0
   var idx:Int = 0
   var curX:CGFloat = 0
//   var prevX:CGFloat = 0
   
   lazy var firstCard:Card = self.createFirst(idx: 0)
   lazy var secondCard:Card = self.createSecond(idx: 1)
   
   override init(frame:CGRect){
		super.init(frame:frame)
      _ = firstCard
      _ = secondCard
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
