//
//  HondaBaseViewController.m
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 1/6/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import "HondaBaseViewController.h"
#import "ADPageControl.h"
#import "HondaRepairItemsViewController.h"

@interface HondaBaseViewController ()<ADPageControlDelegate>{
     ADPageControl   *_pageControl;
    ListAccessoriesViewController *view;
}

@end

@implementation HondaBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.switchBtn.type = MDButtonTypeFloatingAction;
    [self setupPageControl];
}
- (IBAction)btnAdd:(id)sender {
    NSLog(@"abc");
}


-(void)setupPageControl
{
    
    /**** 1. Setup pages using model class "ADPageModel" ****/
    
    
    //page 0
    ADPageModel *pageModel0 = [[ADPageModel alloc] init];
    
    //    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 50, 100)];
    //    lab.text = @"afsfsfs";
    //    [tew.view addSubview:lab];
    view = [[ListAccessoriesViewController alloc]initWithNibName:@"ListAccessoriesViewController" bundle:nil];
    pageModel0.strPageTitle = @"Điện";
    pageModel0.iPageNumber = 0;
    pageModel0.viewController = view;
    //You can provide view controller in prior OR use flag "bShouldLazyLoad" to load only when required
    
    //page 1
    ADPageModel *pageModel1 = [[ADPageModel alloc] init];

    pageModel1.strPageTitle = @"Khung - Truyền động";

    pageModel1.iPageNumber = 1;
    pageModel1.bShouldLazyLoad = YES;

    //page 2
    ADPageModel *pageModel2 = [[ADPageModel alloc] init];
    pageModel2.strPageTitle = @"Nhiên liệu";
    pageModel2.iPageNumber = 2;
    pageModel2.bShouldLazyLoad = YES;
    
    //page 3
    ADPageModel *pageModel3 = [[ADPageModel alloc] init];
    pageModel3.strPageTitle = @"Động cơ";
    pageModel3.iPageNumber = 3;
   pageModel3.bShouldLazyLoad = YES;
    
    
    
    
    /**** 2. Initialize page control ****/
    
    _pageControl = [[ADPageControl alloc] init];
    _pageControl.delegateADPageControl = self;
    _pageControl.arrPageModel = [[NSMutableArray alloc] initWithObjects:pageModel0,pageModel1,pageModel2,pageModel3, nil];
    
    
    
    /**** 3. Customize parameters (Optinal, as all have default value set) ****/
    
    _pageControl.iFirstVisiblePageNumber = 0;
    _pageControl.iTitleViewHeight = 40;
    _pageControl.iPageIndicatorHeight = 4;
    _pageControl.fontTitleTabText =  [UIFont fontWithName:@"Helvetica" size:16];
    
    _pageControl.bEnablePagesEndBounceEffect = NO;
    _pageControl.bEnableTitlesEndBounceEffect = NO;
    
    _pageControl.colorTabText = [UIColor whiteColor];
    _pageControl.colorTitleBarBackground = [UIColor purpleColor];
    _pageControl.colorPageIndicator = [UIColor whiteColor];
    _pageControl.colorPageOverscrollBackground = [UIColor lightGrayColor];
    
    _pageControl.bShowMoreTabAvailableIndicator = NO;
    
    
    
    /**** 3. Add as subview ****/
    
    _pageControl.view.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    [self.view addSubview:_pageControl.view];
    
    [self.view bringSubviewToFront:self.switchBtn];
    
}

#pragma mark - ADPageControlDelegate

//LAZY LOADING

-(UIViewController *)adPageControlGetViewControllerForPageModel:(ADPageModel *) pageModel
{
    NSLog(@"ADPageControl :: Lazy load asking for page %d",pageModel.iPageNumber);
    if (pageModel.iPageNumber) {
        [view getHondaItem:pageModel.strPageTitle];
        return view;
        
    }

    
//    switch (pageModel.iPageNumber) {
//        case 0:{
//            
//        }
//            
//            break;
//        case 1:{
//            
//        }
//            break;
//        case 2:{
//            
//        }
//            break;
//        case 3:{
//            
//        }
//            break;
//            
//            
//        default:
//            return nil;
//            break;
//    }
//    if(pageModel.iPageNumber == 0)
//    {
//        view.view.backgroundColor = [UIColor colorWithRed:204.0/255 green:1 blue:204.0/255 alpha:1.0];//Light Green
//        [view getHondaItem:pageModel.strPageTitle];
//        return view;
//    }
//    else if(pageModel.iPageNumber == 1)
//    {
//        view.view.backgroundColor = [UIColor colorWithRed:204.0/255 green:204.0/255 blue:1 alpha:1.0];//Light Blue
//        [view getHondaItem:pageModel.strPageTitle];
//        return view;
//    }
//    else if(pageModel.iPageNumber == 2)
//    {
//        view.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:204.0/255 alpha:1.0];//Light Yellow
//        [view getHondaItem:pageModel.strPageTitle];
//        return view;
//    }
//    
//    else if(pageModel.iPageNumber == 3)
//    {
//        view.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:150.0/255 alpha:1.0];//Light Yellow
//        [view getHondaItem:pageModel.strPageTitle];
//        return view;
//    }
    return nil;
}

//CURRENT PAGE INDEX

-(void)adPageControlCurrentVisiblePageIndex:(int) iCurrentVisiblePage
{
    NSArray *array = @[@"Điện",@"Khung - Truyền động",@"Nhiên liệu",@"Động cơ"];
    if (!view) {
         view = [[ListAccessoriesViewController alloc]initWithNibName:@"ListAccessoriesViewController" bundle:nil];
    }
    [view getHondaItem:[array objectAtIndex:iCurrentVisiblePage]];
}

- (IBAction)buttonClick:(id)sender {
    
   
    HondaRepairItemsViewController *repair = [[HondaRepairItemsViewController alloc ]initWithNibName:@"HondaRepairItemsViewController" bundle:nil];
    [self   presentViewController:repair animated:NO completion:^{
        
    }];
}

@end
