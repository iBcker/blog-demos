//
//  ViewController.m
//  BackgroundAlertTest
//
//  Created by iBcker on 15/8/30.
//  Copyright © 2015年 ibcker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"alert" message:@"message" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil] show];
}
@end
