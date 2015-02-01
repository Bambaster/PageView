//
//  ViewController.m
//  UIPageControlWithImage
//
//  Created by Eugene Melnyk on 24.01.15.
//  Copyright (c) 2015 Eugene Melnyk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


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
//    
    page = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    pageControl.currentPage = page;
//
//    
//    if (pageControl.currentPage == 0) {
//        
//        label.textColor = [UIColor yellowColor];
//        UIFont *font = [UIFont fontWithName:@"Arial" size:20];
//        [label setFont:font];
//        
//        label.text = @"Страница 1";
//        
//    }
//    
//    if (pageControl.currentPage == 1) {
//        
//        label.textColor = [UIColor redColor];
//        UIFont *font = [UIFont fontWithName:@"Arial" size:25];
//        [label setFont:font];
//        label.text = @"Страница 2";
//    }
//    
//    if (pageControl.currentPage == 2) {
//        
//        label.textColor = [UIColor whiteColor];
//        UIFont *font = [UIFont fontWithName:@"Arial" size:30];
//        [label setFont:font];
//        label.text = @"Страница 3";
//    }
    
    NSLog(@"%d", page);
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * array_images = [[NSArray alloc]initWithObjects:@"1.jpg", @"2.jpg", @"3.jpg", nil];
    NSArray * array_pages = [[NSArray alloc]initWithObjects:@"Страница 1", @"Страница 2", @"Страница 3", nil];
    NSMutableArray * array_result = [NSMutableArray array];


    
    
    for (int i = 0; i< array_images.count; i++) {
        
        NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:
        [array_images objectAtIndex:i],@"image_name",
        [array_pages objectAtIndex:i],@"page_name",
        nil];

        
        [array_result addObject:dict];
    }
    
    
    for (int i = 0; i< array_result.count; i++) {
        
        UIImageView *imagen = [[UIImageView alloc]init];
        imagen.frame = CGRectMake(i * 320, 0, 320, 200);
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [[array_result objectAtIndex:i]valueForKey:@"image_name"]]];
        imagen.image = image;
        
        UILabel * page_name = [[UILabel alloc] initWithFrame:CGRectMake(0, 200 + 20, 320, 30)];
        page_name.text = [NSString stringWithFormat:@"%@", [[array_result objectAtIndex:i]valueForKey:@"page_name"]];
        page_name.textAlignment = NSTextAlignmentCenter;
        page_name.textColor = [UIColor whiteColor];


        [imagen setContentMode:UIViewContentModeScaleAspectFit];
        [imagen addSubview:page_name];
        [scroller addSubview:imagen];
        
      
        
    }
    
    scroller.delegate = self;
//    float offset = self.view.frame.size.width * self.array.count;
//
//    [scroller setContentInset:UIEdgeInsetsMake(0, 0, 0, offset)];

    
    scroller.contentSize = CGSizeMake(320* array_result.count, 200); // (320*3) - this number of pages for scroll
    scroller.pagingEnabled = YES;
    
    [self.view addSubview:scroller];
    
    
    pageControl.numberOfPages = array_result.count;
    pageControl.currentPage = 0;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
