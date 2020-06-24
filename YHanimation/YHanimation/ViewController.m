//
//  ViewController.m
//  YHanimation
//
//  Created by yonghui liu on 2020/5/21.
//  Copyright © 2020 刘永慧. All rights reserved.
//

#import "ViewController.h"
#import "UIViewAnimationController.h"
#import "CABasicAnimationViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *animationTableView;
@property (nonatomic, strong) NSMutableArray *animationTypeArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"iOS动画";
    [self.animationTypeArray addObject:@"基本动画-UIView"];
    [self.animationTypeArray addObject:@"基本动画-CABasicAnimation"];
    [self.view addSubview:self.animationTableView];
}

// MARK: ~~~~~~~~ delegate & dataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0://UIView动画
        {
            UIViewAnimationController *viewAnimationVC = [[UIViewAnimationController alloc] init];
            [self.navigationController pushViewController:viewAnimationVC animated:YES];
        }
            break;
        case 1://基本动画
        {
            CABasicAnimationViewController *caVC = [[CABasicAnimationViewController alloc] init];
            [self.navigationController pushViewController:caVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animationTypeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"animationID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.animationTypeArray objectAtIndex:indexPath.row];
    return cell;
}

// MARK: ~~~~~~~~setter
- (UITableView *)animationTableView {
    if (!_animationTableView) {
        CGRect tableViewFrame = self.view.frame;
        _animationTableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
        _animationTableView.delegate = self;
        _animationTableView.dataSource = self;
    }
    return _animationTableView;
}

- (NSMutableArray *)animationTypeArray {
    if (!_animationTypeArray) {
        _animationTypeArray = [NSMutableArray array];
    }
    return _animationTypeArray;
}

@end
