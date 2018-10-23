import UIKit

class Item:UIView,ItemKind{
//   var state:ItemState = .inActive
   var idx:Int
   init(idx:Int,frame:CGRect){
      self.idx = idx
		super.init(frame:frame)
//      isUserInteractionEnabled = true
	}
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   func appeared() {
		//continue playing things,
		//or create things
		//or load things from external services
	}
	func disappeared() {
		//pause playing things,
		//or deInit things
		//or cancel loading things from external services
	}
}
