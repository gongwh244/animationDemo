//
//  ViewController.m
//  cellDemo
//
//  Created by gongWeiqiang on 15/3/31.
//  Copyright (c) 2015年 gongweiqiang. All rights reserved.
//-

#import "ViewController.h"
#import "myCell.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (strong, nonatomic) NSMutableArray *totalArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _totalArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 15; i++) {
        [_totalArray addObject:[NSString stringWithFormat:@"111%d",i]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _totalArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    myCell *mCell = (myCell *)cell;
    mCell.nameLabel.text = [_totalArray objectAtIndex:indexPath.row];
    mCell.endBlock = ^(BOOL isDelete, NSIndexPath *indexpath){
        if (isDelete) {
            [_myTable beginUpdates];
            [_totalArray removeObjectAtIndex:indexPath.row];
            [_myTable deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
            [_myTable endUpdates];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_myTable reloadData];
            });
        }else{
            [_myTable reloadData];
        }
        
    };
    
    mCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return mCell;
}

@end
