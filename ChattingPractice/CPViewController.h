//
//  CPViewController.h
//  ChattingPractice
//
//  Created by Jiyeon Seo on 12. 8. 28..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    UITableView *mainTableView;
    UIView *msgView;
    UITextField *msgTextField;
    UIButton *msgButton;
}
@property (nonatomic, strong) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong) IBOutlet UIView *msgView;
@property (nonatomic, strong) IBOutlet UITextField *msgTextField;
@property (nonatomic, strong) IBOutlet UIButton *msgButton;

-(IBAction)msgSend:(id)sender;

@end
