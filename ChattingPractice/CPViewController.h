//
//  CPViewController.h
//  ChattingPractice
//
//  Created by Jiyeon Seo on 12. 8. 28..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate,UIScrollViewDelegate, UIGestureRecognizerDelegate>{
    
}
 

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIView *msgView;
@property (nonatomic, strong) IBOutlet UITextField *msgTextField;
@property (nonatomic, strong) IBOutlet UIButton *msgButton;

-(IBAction)msgSend:(id)sender;
-(IBAction)backgroundTouched:(id)sender;
@end
