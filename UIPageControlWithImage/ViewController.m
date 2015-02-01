//
//  ViewController.m
//  UIPageControlWithImage
//
//  Created by Eugene Melnyk on 24.01.15.
//  Copyright (c) 2015 Eugene Melnyk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray * array;

@end

@implementation ViewController {
    
    NSArray *sliderurl;
    NSArray *sliderurl2;

    int v;
    int iv;
    int eugene;
    int melnyk;
    int page;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
//    NSLog(@"%f", scrollView.contentOffset.x);
    
    page = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    pageControl.currentPage = page;
    
    
    if (pageControl.currentPage == 0) {
        
        label.textColor = [UIColor yellowColor];
        UIFont *font = [UIFont fontWithName:@"Arial" size:20];
        [label setFont:font];
        
        label.text = @"Страница 1";
        
    }
    
    if (pageControl.currentPage == 1) {
        
        label.textColor = [UIColor redColor];
        UIFont *font = [UIFont fontWithName:@"Arial" size:25];
        [label setFont:font];
        label.text = @"Страница 2";
    }
    
    if (pageControl.currentPage == 2) {
        
        label.textColor = [UIColor whiteColor];
        UIFont *font = [UIFont fontWithName:@"Arial" size:30];
        [label setFont:font];
        label.text = @"Страница 3";
    }
    
    NSLog(@"%d", page);
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [NSMutableArray array];
    
    
    for (int i =1; i<4; i++) {
        
        [self.array addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i]]];
    }
    
    
    
    for (int i = 0; i<self.array.count; i++) {
        
        UIImageView *imagen = [[UIImageView alloc]initWithImage:[self.array objectAtIndex:i]];
        
        imagen.frame = CGRectMake(i * 320, 0, 320, 200);

        [imagen setContentMode:UIViewContentModeScaleAspectFit];
        
        [scroller addSubview:imagen];
        
        //        [self.view addSubview:label];
        
    }
    
    scroller.delegate = self;
//    float offset = self.view.frame.size.width * self.array.count;
//
//    [scroller setContentInset:UIEdgeInsetsMake(0, 0, 0, offset)];

    
    scroller.contentSize = CGSizeMake(320* self.array.count, 200); // (320*3) - this number of pages for scroll
    scroller.pagingEnabled = YES;
    
    [self.view addSubview:scroller];
    
    
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
