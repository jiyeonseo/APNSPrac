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
    
//
//    NSNotification *info;
//    
//    NSValue* aValue =[info objectForKey:UIKeyboardBoundsUserInfoKey];
//    CGSize keyboardSize = [aValue CGRectValue].size];
    
//    UIGestureRecognizer *gesture = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(handletap:)];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGesture.numberOfTapsRequired = 5;
    tapGesture.delegate = self;
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [swipe setDirection: UISwipeGestureRecognizerDirectionRight];
    
    UILongPressGestureRecognizer *longClick = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    
    [tableView addGestureRecognizer:tapGesture];
    [tableView addGestureRecognizer:swipe];
    [tableView addGestureRecognizer:longClick];
    
}

- (void)handleTap:(UIGestureRecognizer *)gesture
{
    [msgTextField resignFirstResponder];
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
    
    cell.textLabel.text = [self.msgArray objectAtIndex:[indexPath row]];
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [msgTextField resignFirstResponder];
}

#pragma mark - keyBoard

#pragma mark - TextField Delegate 

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{ // when wrting started

    [UIView animateWithDuration:0.3 animations:^{
        self.msgView.center = CGPointMake(self.msgView.center.x, self.msgView.center.y-215);
    }];
    
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{ // when writing hav done
    [UIView animateWithDuration:0.3 animations:^{
        self.msgView.center = CGPointMake(self.msgView.center.x, self.msgView.center.y+215);
    }];

    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{ //not working
    [msgTextField resignFirstResponder];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{ // enter function
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

#pragma mark - UITouch
// keyboad control 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)events
{
    
    [super touchesBegan:touches withEvent:events];
    
    NSLog(@"누름");
    if(![[[touches anyObject] view] isKindOfClass:[UITextField class]])
    {
        [msgTextField resignFirstResponder];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

#pragma mark - UIGestureRecognizer Delegate

@end
