//
//  myCell.m
//  cellDemo
//
//  Created by gongWeiqiang on 15/3/31.
//  Copyright (c) 2015年 gongweiqiang. All rights reserved.
//

#import "myCell.h"

@interface myCell ()

@property (nonatomic,strong)UIView *snapView;

@end

@implementation myCell

- (void)awakeFromNib {
    // Initialization code
    _displayView.layer.cornerRadius = 5.0f;
    
    _containView.layer.shadowColor = [UIColor blackColor].CGColor;
    _containView.layer.shadowOffset = CGSizeMake(2, 2);
    _containView.layer.shadowOpacity = 1;
    _containView.layer.shadowRadius = 5;
    _containView.layer.cornerRadius = 5;
    
    UILongPressGestureRecognizer *longGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressLongGestureRecognizer:)];
    [self.contentView addGestureRecognizer:longGr];
}

- (void)pressLongGestureRecognizer:(UILongPressGestureRecognizer *)longGr
{
    CGPoint startPoint = CGPointZero;
    
    switch (longGr.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"began");
            _snapView = [_containView snapshotViewAfterScreenUpdates:NO];
            startPoint = [longGr locationInView:self.contentView];
            
            _snapView.frame = _containView.frame;
            _snapView.layer.edgeAntialiasingMask = NO;
            _snapView.layer.cornerRadius = 5.0f;
            _snapView.layer.shadowColor = [UIColor blackColor].CGColor;
            _snapView.layer.shadowOffset = CGSizeMake(2, 2);
            _snapView.layer.shadowOpacity = 1;
            _snapView.layer.shadowRadius = 5;
            
            _snapView.transform = CGAffineTransformMakeRotation(M_PI / 30);
            [self.contentView addSubview:_snapView];
            _containView.hidden = YES;
            _displayView.hidden = YES;
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            NSLog(@"changed");
            CGPoint changPoint = [longGr locationInView:self.contentView];
            _snapView.center = changPoint;
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"end");
            CGPoint endPoint = [longGr locationInView:self.contentView];
            if (endPoint.x >= self.contentView.frame.size.width -50) {
                if (self.endBlock) {
                    self.endBlock(YES,_indexPath);
                }
            }else{
                if (self.endBlock) {
                    self.endBlock(NO,_indexPath);
                }
            }
            [_snapView removeFromSuperview];
            _containView.hidden = NO;
            _displayView.hidden = NO;
        }
            break;
            
        default:
            break;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
