//
//  myCell.h
//  cellDemo
//
//  Created by gongWeiqiang on 15/3/31.
//  Copyright (c) 2015年 gongweiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^handleEndBlock)(BOOL isDelete , NSIndexPath *path);

@interface myCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *containView;
@property (strong, nonatomic) IBOutlet UIView *displayView;
@property (strong, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (copy, nonatomic) handleEndBlock endBlock;


@end
