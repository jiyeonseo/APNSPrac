//
//  CPViewController.m
//  ChattingPrac
//
//  Created by Jiyeon Seo on 12. 8. 28..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()
{
    NSMutableArray *msgArray;
}
@property (nonatomic, strong) NSMutableArray *msgArray;
@end

@implementation CPViewController
@synthesize tableView, msgView, msgTextField, msgButton;
@synthesize msgArray;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	msgArray = [[NSMutableArray alloc]init];
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

#pragma mark - TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [msgArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell ==nil){
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
//    cell.textLabel.text = @"test";
    cell.textLabel.text = [self.msgArray objectAtIndex:[indexPath row]];
    return cell;
}

#pragma mark - TextField Delegate 
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    [UIView animateWithDuration:0.3 animations:^{
        self.msgView.center = CGPointMake(self.msgView.center.x, self.msgView.center.y-215);
    }];
    
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        self.msgView.center = CGPointMake(self.msgView.center.x, self.msgView.center.y+215);
    }];

    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    //안되네;
    NSLog(@"들 ㅋ 어 ㅋ 옴 ㅋ");
    [msgTextField resignFirstResponder];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [msgArray addObject:msgTextField.text];
    msgTextField.text =@"";
    [tableView reloadData];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - ClickAction
-(IBAction)msgSend:(id)sender{
    [msgArray addObject:msgTextField.text];
    msgTextField.text =@"";
    [tableView reloadData];
    [msgTextField resignFirstResponder];
}
-(IBAction)backgroundTouched:(id)sender{
    //View클릭시 textField keyboard 사라짐 
    [msgTextField resignFirstResponder];
}

@end
