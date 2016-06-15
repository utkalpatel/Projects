//
//  ViewController.m
//  Calendar
//
//  Created by developer on 6/15/16.
//  Copyright (c) 2016 developer. All rights reserved.
//

#import "ViewController.h"
#import "customCellCollectionViewCell.h"

@interface ViewController ()
{
    NSDate *CurrentDate;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self init_instance];
}

-(void)init_instance{
    
    //[colCalender registerClass:[customCellCollectionViewCell class] forCellWithReuseIdentifier:@"customCell"];
    [colCalender setBackgroundColor:[UIColor clearColor]];
    
    [colCalender registerNib:[UINib nibWithNibName:@"customCellCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"customCell"];
     if(!arrcalData){
        
        arrcalData = [[NSMutableArray alloc]init];
     }
    
    NSDate *today =[NSDate date];
    [self setCalendar:today];
    
}

-(void)setCalendar:(NSDate*)curDate{
    
    [arrcalData removeAllObjects];
    
    NSArray *arrWeak =[[NSArray alloc]initWithObjects:@"S",@"M",@"T",@"W",@"T",@"F",@"S",nil];
  
    [arrcalData addObjectsFromArray:arrWeak];
    
    CurrentDate = curDate;
    NSCalendar *c = [NSCalendar currentCalendar];
    NSRange days = [c rangeOfUnit:NSCalendarUnitDay
                           inUnit:NSCalendarUnitMonth
                          forDate:curDate];
    int firstweekday = [self getFirstDay:curDate];
    
    lblSelectedMonth.text = [self getDateInString:curDate];
    
    for(int j = 1 ;j<firstweekday;j++){
        [arrcalData addObject:[NSString stringWithFormat:@"-"]];
    }
    for(int i=1;i<=days.length;i++){
        [arrcalData addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    
}

-(NSString*)getDateInString:(NSDate*)date{
    
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"MMMM, yyyy"];
     NSString *reqDateString = [dateFormatter stringFromDate:date];
     return reqDateString;
    
}

-(int)getFirstDay:(NSDate*)date{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:date];
    [comp setDay:1];
     //NSDate *firstDayOfMonthDate = [gregorian dateFromComponents:comp];
    
    int weekday = [comp weekday];
    return weekday;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnNextClicked:(id)sender{
    
    CurrentDate = [self getNextMonth:CurrentDate];
   [self setCalendar:CurrentDate];
    [colCalender reloadData];
}
-(IBAction)btnPreviousclicked:(id)sender{
    CurrentDate = [self getNextMonth:CurrentDate];
     [self setCalendar:CurrentDate];
    [colCalender reloadData];
}
-(NSDate*)getPreviousMonth:(NSDate*)date{
    
    date= [date dateByAddingTimeInterval: -5259487.66];
    //date = [date dateByAddingTimeInterval:(30 * 24 * 60 * 60)];
    return date;
    
}
-(NSDate*)getNextMonth:(NSDate*)date{
    date = [date dateByAddingTimeInterval:(30 * 24 * 60 * 60)];
    return date;
}
#pragma mark UIcollectionview Delegate.
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [arrcalData count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    customCellCollectionViewCell *cell = (customCellCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    
    [cell setCellData:[arrcalData objectAtIndex:indexPath.row]];
    return cell;
    
}

@end
