//
//  ViewController.h
//  UIPageControlWithImage
//
//  Created by Eugene Melnyk on 24.01.15.
//  Copyright (c) 2015 Eugene Melnyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>{
    
   IBOutlet UIPageControl *pageControl;
   IBOutlet UIScrollView *scroller;
    IBOutlet UILabel *label;
    IBOutlet UIImageView *ima;
    
//    NSArray *array;
}


@end

