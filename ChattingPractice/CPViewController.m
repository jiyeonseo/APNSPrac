//
//  CPViewController.m
//  ChattingPractice
//
//  Created by Jiyeon Seo on 12. 8. 28..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()

@end

@implementation CPViewController
@synthesize mainTableView, msgView, msgTextField;

#pragma mark - View lifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
#pragma mark - TableView delegate method 
-

#pragma mark - TextField delegate method
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        self.msgView.center = CGPointMake(self.msgView.center.x, self.msgView.center.y - 215);
    }];
    
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:03. animations:^{
        self.msgView.center = CGPointMake(self.msgView.center.x, self.msgView.center.y+215);
    }];
    
    return YES;
}
@end
