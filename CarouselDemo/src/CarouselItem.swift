import UIKit

class CarouselItem:UIView,CarouselKind{
	var state:CarouselState = .inActive
   override init(frame:CGRect){
		super.init(frame:frame)
	}
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
