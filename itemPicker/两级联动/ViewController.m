//
//  ViewController.m
//  两级联动
//
//  Created by Jason on 15/8/23.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "XLCollectionViewCell.h"
#import "XLTableViewCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *firstView;
@property (weak, nonatomic) IBOutlet UICollectionView *secondView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSDictionary *datas;
@property (nonatomic, strong) NSArray *firstTitleList;
@property (nonatomic, strong) NSArray *secondTitleList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 注册cell
    [self.secondView registerNib:[UINib nibWithNibName:@"XLCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"XLCollectionViewCell"];
    [self.firstView registerNib:[UINib nibWithNibName:@"XLTableViewCell" bundle:nil] forCellReuseIdentifier:@"XLTableViewCell"];
    // 设置样式
    self.firstView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 取消inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 设置collectionView布局
    self.flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.secondView.frame) / 2, 60);
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    // 选中第一组
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.firstView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.firstView didSelectRowAtIndexPath:indexPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource/Delegate
// 父列表

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XLTableViewCell"];
    cell.title = self.firstTitleList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.secondTitleList = self.datas[self.firstTitleList[indexPath.row]];
    [self.secondView reloadData];
}

#pragma mark - UICollectionViewDelegate/DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.secondTitleList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XLCollectionViewCell" forIndexPath:indexPath];
    cell.title = self.secondTitleList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark - Getter & Setter 

- (NSDictionary *)datas {
    if (!_datas) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil];
        self.datas = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return _datas;
}

- (NSArray *)firstTitleList {
    if (!_firstTitleList) {
        self.firstTitleList = [self.datas allKeys];
    }
    return _firstTitleList;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = self.secondTitleList[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
