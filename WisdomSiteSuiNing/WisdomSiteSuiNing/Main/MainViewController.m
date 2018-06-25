
//
//  MainViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "MainViewController.h"
#import "MainBannerTableViewCell.h"
#import "ProgressTableViewCell.h"
#import "ThreeTableViewCell.h"
#import "QualityListViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,ProgressTableViewCellDelegate,ThreeTableViewCellDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic)NSMutableArray*listArr;
@property(strong,nonatomic)NSMutableArray *MeetingArr;



@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"首页";
    [self setNavBackButton:@"green_contruction.png"];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    self.MeetingArr=[NSMutableArray array];
    
    NSArray *array = @[@{@"title":@"质量管理",@"pic":@"1.png",@"type":@"0"},
                       @{@"title":@"安全管理",@"pic":@"2.png",@"type":@"10"},
                       @{@"title":@"文档管理",@"pic":@"work_audit_inner.png",@"type":@"20"},
                       @{@"title":@"进度管理",@"pic":@"work_progress_check.png",@"type":@"30"},
                       @{@"title":@"竣工验收",@"pic":@"problem.png",@"type":@"40"},
                       @{@"title":@"投资管理",@"pic":@"money_bag.jpg",@"type":@"50"}];
    [self.listArr addObjectsFromArray:array];
    
}
#pragma mark --UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 215;
    }if (indexPath.row==1) {
        return 140;
    }
    if (indexPath.row==2) {
        return 300;
    }
    return 300;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        MainBannerTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"MainBannerTableViewCell"];
        if (!cell) {
            cell=[[NSBundle mainBundle]loadNibNamed:@"MainBannerTableViewCell" owner:nil options:nil].firstObject;
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell reloadCellWithPicArr:@[@"home_banner",@"banner_1.jpg",@"banner_2.jpg",@"banner_3.jpg",@"banner_4.jpg"]];
        cell.buttonActionBlock = ^(NSInteger tag) {
            NSLog(@"滚动图被点击了");
        };
        return cell;
    }else if (indexPath.row==1){
        ProgressTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"ProgressTableViewCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"ProgressTableViewCell" owner:nil options:nil].firstObject;
        }
        cell.delegate = self;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell reloadCellData:nil];
        return cell;
    }else{
        ThreeTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeTableViewCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"ThreeTableViewCell" owner:nil options:nil].firstObject;
        }
        cell.delegate = self;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell reloadCellData:self.listArr WithMeetingArr:self.MeetingArr];
        return cell;
    }
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=[NSString stringWithFormat:@"我是第%ld个页面的cell",tableView.tag+1];
    return cell;
}
#pragma mark ---ProgressTableViewCellDelegate 点击环形进度条
-(void)backButtonAction{
    
}
#pragma mark - ThreeTableViewCellDelegate
- (void)threeButtonAction:(NSInteger)tag{
    switch (tag) {
        case 0:{
            QualityListViewController*qualityVC=[[QualityListViewController alloc]init];
            qualityVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:qualityVC  animated:YES];
        }
            break;
        case 10:{
            
        }
            break;
        case 20:{
            
        }
            break;
        case 30:{
            
        }
            break;
        case 40:{
            
        }
            break;
        case 50:{
            
        }
            break;
            
        default:
            break;
    }
}
-(void)notificationButtonAction:(NSInteger)tag{
    
}

-(NSMutableArray *)listArr{
    if (!_listArr) {
        _listArr = [NSMutableArray array];
    }
    return _listArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
