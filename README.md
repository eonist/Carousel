### Carousel
Carousel is a small framework that enables you to gesture between views.

### Features
- Infinite loop
- Re-uses Views (only 2 views are made)
- appeared and disappeared can be overridden
- Uses standard UIViewPropertyAnimator
- Uses AutoLayout to position views

### Dependencies
- [Spatial](https://www.GitHub.com/eonist/Spatial)

### Todo's
```swift
//Figure out the 1,2,3 slots ✅  
	//slots are rearanged at release of touch, and at   onScroll, no only at onScroll ✅  
	//make the reArrange(x:CGFloat) method 👈 👈 👈
		//its job is to keep track of idx, call apeared, and disapeared, and set carouselState on items
		//send (anim.fractionComplete * width) when you stop midway in animation, aka onTap
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


//figure out what happens
         //prob just floor and it works ✅
         //use the curXPos to skip moving forward / backward if it isn't nessasary. if your already on the correct idx etc 🚫
         //when you move backwards the first time, the idx doesnt change 🚫
         //you can probably solve all this by untroducing curIdx:Int? = nil and having initIdx 🚫
         //idx should always reflect the idx of the firstCard 🚫


		//Make github repo, add pseudo code ✅
		//Disable the code that isn't needed for testing gestures ✅
		   //make Carousel+Extension.swift ✅
		//look at the legacy code, and how you position left right idle etc. ✅
		//create 4 views. with the 4 debug colors ✅

		//get the rgb vals for the cool colors
		//make the createCards methods ✅
		//when idx switches, ✅
		   //then on the basis of which dir the idx switch is going then call, apear, disapar on items ✅

//add Spatial to Carousel 🏀
   //make appear and disapear work 👈
   //set idx to cards in rearrange
   //make Carousel overridable
   //add carousell to WeatherCardsApp
   //use terminology from tableview or your own table view when setting data, reuse etc
   //test animating the cards
   //test stopping animatiopn mid way etc
   //test programtically sliding cards. setCardIdx etc
   //make gif of WeatherCardsApp
   //Finish spatial, carousel, chaplin then work on HCCQR and beam  👌
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
