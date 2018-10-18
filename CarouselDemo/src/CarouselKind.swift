protocol CarouselKind {
	/**
    * If the Carousel-Item is within the visible part of the Carousel, the state is active.
	 * If the Carousel-Item is within the invisible part of the Carousel, the state is inActive.
    */
	var state:State
	/**
    * Called when view comes into the visible part of the carousel
	 * NOTE: will only be called if state is .inActive
    */
	func appeared()
	/**
	 * Called when view goes out of the visible part of the carousel
	 * NOTE: will only be called if state is already .active
	 */
	func disappeared() 
}
extension CarouselKind {
  enum State{
  case active, inActive
  }
}
