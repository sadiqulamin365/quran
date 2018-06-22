//
//  ViewController.m
//  Quran
//
//  Created by MacBook Pro Retina on 20/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "ViewController.h"
#import "First.h"
#import "Second.h"
#import "Third.h"


@interface ViewController ()
{
    
    
    __weak IBOutlet UIView *pagingeView;
    UIScrollView *scrollView;
    NSMutableArray *arrayForView;
}

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(createUI) withObject:self afterDelay:0.2];
    arrayForView=[[NSMutableArray alloc]init];
    
}
-(void)createUI
{
     CGSize size = pagingeView.frame.size;
    
    
     First *V1 = (First*)[[[NSBundle mainBundle]loadNibNamed:@"First" owner:self options:nil] objectAtIndex:0];
     Second *V2 = (Second*)[[[NSBundle mainBundle]loadNibNamed:@"Second" owner:self options:nil] objectAtIndex:0];
     Third *V3 = (Third*)[[[NSBundle mainBundle]loadNibNamed:@"Third" owner:self options:nil] objectAtIndex:0];
    
   
  
    
    self.containerView.contentSize = CGSizeMake(3*size.width, 0);
    self.containerView.clipsToBounds = YES;
    [self.containerView  setContentOffset:CGPointMake(0, 0)];
  
    
    
    [arrayForView addObject:V1];
    [arrayForView addObject:V2];
    [arrayForView addObject:V3];
    
    
    V1.backgroundColor=[UIColor redColor];
    [self addView:V1:0];
    [self addView:V2:1];
    [self addView:V3:2];
  
    
   
    
    
    self.containerView.pagingEnabled = YES;
    self.containerView.showsVerticalScrollIndicator=NO;
    self.containerView.showsHorizontalScrollIndicator=NO;
   
    
}
-(void)addView:(UIView*)viewToAdd:(int)i
{
    CGSize size = pagingeView.frame.size;
    viewToAdd.frame=CGRectMake(i*size.width, 0, size.width, size.height);
    [self.containerView addSubview:viewToAdd];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
