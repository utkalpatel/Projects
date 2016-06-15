//
//  customCellCollectionViewCell.m
//  Calendar
//
//  Created by developer on 6/15/16.
//  Copyright (c) 2016 developer. All rights reserved.
//

#import "customCellCollectionViewCell.h"

@implementation customCellCollectionViewCell
@synthesize lblCalData;
- (void)awakeFromNib {
    // Initialization code
}

/*
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:lblCalData];
    }
    return self;
}*/
-(void)setCellData:(NSString *)strData{

    [lblCalData setBackgroundColor:[UIColor greenColor]];
    lblCalData.text = strData;
    if([strData  isEqual: @"-"]){
        lblCalData.backgroundColor = [UIColor clearColor];
        lblCalData.text = @"";
    }
}

@end
