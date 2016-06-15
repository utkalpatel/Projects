//
//  ViewController.h
//  Calendar
//
//  Created by developer on 6/15/16.
//  Copyright (c) 2016 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    IBOutlet UILabel *lblDate;
    IBOutlet UILabel *lblSelectedMonth;
    IBOutlet UICollectionView *colCalender;
    
    NSMutableArray *arrcalData;
    
}
-(IBAction)btnNextClicked:(id)sender;
-(IBAction)btnPreviousclicked:(id)sender;


@end

