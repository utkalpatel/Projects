//
//  customCellCollectionViewCell.h
//  Calendar
//
//  Created by developer on 6/15/16.
//  Copyright (c) 2016 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCellCollectionViewCell : UICollectionViewCell


@property(nonatomic,weak)UILabel *lblCalData;
-(void)setCellData:(NSString*)strData;
@end
