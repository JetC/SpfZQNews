//
//  SFViewController.m
//  SpfZQNews
//
//  Created by 孙培峰 on 2/26/14.
//  Copyright (c) 2014 孙培峰. All rights reserved.
//

#import "SFViewController.h"
#import "GuGuSegmentBarView.h"

@interface SFViewController ()



@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int r = rand() % 255;
    int b = rand() % 255;
    self.view.backgroundColor = RGBCOLOR(r,255, b);
    
    //标示出每个ViewController
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, 320, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.labelTitle;
    label.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
