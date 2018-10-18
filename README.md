### Carousel
Carousel is a small framework that enables you to gesture between views.

### Features
- Infinite loop
- Re-uses Views (only 3 views are made)
- appeared and disappeared can be overridden
- Uses standard UIViewPropertyAnimator
- Uses AutoLayout to position views

### Dependencies
- [Spatial](https://www.GitHub.com/eonist/Spatial)

### Todo's
```swift
//Figure out the 1,2,3 slots ✅  
	//slots are rearanged at release of touch, and at   onScroll ✅  
	//make the reArrange(x:CGFloat) method 👈 👈 👈
		//its job is to keep track of idx, call apeared, and disapeared, and set carouselState on items
		//send (anim.fractionComplete * width) when you stop midway in animation
		//when panning send: curXOffset = curXOffset + pan.offset
		//try to get the correct indecies etc. 
//how do we fill them with cards ✅  
//what happens when there is only one or two cards or five. 🚫  
//  
//Figure out friction at edges. 🚫  
	//Find your animator ios project. 🚫  
		//look for Animator.swift refs, look for dates, look inside harddrives etc. 🚫  


//Figure out detect axis 👈 🚫  
	//use trig from press to drag.dist >= 64 to activate, actually drag.dist.x > 54 or .y > 54  
//Add loops feature later  
```


### Early thinking

//You create a gray rectangle

//you add press,release,pan to the grayRect

//you init anim on release

//you stop anim on press of greyRect

//you figure out curProgress of UIAnim on stop

//take the offset of curProgress and add that to paning

//keep panning the 1 or 2 or 3 items currently being panned

//the job of the animation is just to animate whatever is in the carousel slots

//if at the edges and carousel.isLooping == false, then apply friction

	//research apples friction anim lib


//draw the above and think 👆,

//research if you can record the curProgress on stop 👈
