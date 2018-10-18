import UIKit

class CarouselItem:UIView,CarouselKind{

	var state:State = .inActive

	init(frame:CGRect){
		super.init(frame:frame)
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
