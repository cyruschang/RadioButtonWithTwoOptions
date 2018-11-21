//
//  ViewController.m
//  RadioButton
//
//  Created by hualala on 2018/11/21.
//  Copyright © 2018 hualala. All rights reserved.
//

#import "ViewController.h"
#import "RadioButton/RadioButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RadioButton *button = [[RadioButton alloc] initWithFrame:CGRectMake(100, 100, 200, 44)];
    button.options = @[@"男", @"女"];
    [self.view addSubview:button];
}


@end
