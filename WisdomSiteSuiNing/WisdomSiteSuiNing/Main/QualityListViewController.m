
//
//  QualityListViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/25.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "QualityListViewController.h"
#import "QualityListCell.h"
#import "QualityListModel.h"

#define kMinCount 20

@interface QualityListViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
    NSInteger   _pageCount;
}

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArr;
@property (strong, nonatomic) NSString    *state;

@end

@implementation QualityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"质量整改";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = UITableViewAutomaticDimension;//高度自适应
    self.tableView.estimatedRowHeight=253.0;
    
    [self setNavRightButton:@"add_img.png"];
    
    [self.button setBackgroundImage:[UIImage imageNamed:@"left.png"] forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage imageNamed:@"bottom.png"] forState:UIControlStateSelected];
    
    _state=@"";
    self.dataArr=[NSMutableArray array];
    __weak typeof(self) this =self;
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{//下拉刷新
        [this getQualityListRequestWithState:this.state IsRefresh:YES];
    }];
    self.tableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{//上拉加载更多
        [this getQualityListRequestWithState:this.state IsRefresh:NO];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}
#pragma mark---质量管理列表网络请求
-(void)getQualityListRequestWithState:(NSString *)state IsRefresh:(BOOL)isRefresh{
    if (isRefresh) {
        _pageCount = 0;
    }else{
        _pageCount+=1;
    }
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userid = [user objectForKey:@"id"];
    //    [MBProgressHUD showLoadingMessage:@"加载中..."];//显示转圈的view
    [[NetWorkTool shareInstance]requestQualityListMsgWithState:state pageSize:[NSString stringWithFormat:@"%d",kMinCount] page:[NSString stringWithFormat:@"%ld",_pageCount] user_id:userid withResponse:^(NSError *error, id response)  {
        //        [MBProgressHUD hideHUD];//数据返回后  无论失败还是好吃呢公共都要隐藏转圈的view
        __weak typeof(self) this = self;
        if (error != nil) {
            NSLog(@"请求失败 : error%@",error);
            [self.tableView.mj_header endRefreshing];//结束头部的刷新动画效果
            [self.tableView.mj_footer endRefreshing];//结束尾部的刷新动画效果
            [MBProgressHUD showMessage:@"网络加载失败"];
        }else{
            [this responseQualityListMsg:response IsRefresh:isRefresh];
        }
    }];
    
}

-(void)responseQualityListMsg:(id)response IsRefresh:(BOOL)isRefresh{
    if ([response isKindOfClass:[NSDictionary class]]) {
        NSDictionary*dic=(NSDictionary*)response;
        NSInteger code=[[dic objectForKey:@"errcode"] integerValue];
        if (code==0) {
            NSLog(@"质量列表获取成功");
            if (isRefresh) {
                [self.dataArr removeAllObjects];
            }
            //开始数据解析
            NSArray*data=[dic objectForKey:@"data"];
            if (data.count > 0) {//有数据的时候   重新把数据加到数组中 (看看这句注释)
                for (int i=0; i<data.count; i++) {
                    NSDictionary*dataDic=[data objectAtSafeIndex:i];
                    QualityListModel*model=[[QualityListModel alloc]initWithQualityListDictionary:dataDic];
                    [self.dataArr addObject:model];
                }
            }
            //刷新表
            [self endRefreshWithState:YES dataCount:data.count];
            [self.tableView reloadData];
        }
        else{
            NSLog(@"列表获取失败");
            [self endRefreshWithState:YES dataCount:0];
            [MBProgressHUD showMessage:@"质量列表获取失败"];
        }
    }
}
-(void)endRefreshWithState:(BOOL)isSuccess dataCount:(NSInteger)count {
    if (_pageCount == 0) {
        //下拉
        [self.tableView.mj_header endRefreshing];//结束头部的刷新动画效果
        [self.tableView.mj_footer endRefreshing];//结束尾部的刷新动画效果
    }else {//上拉
        if (isSuccess && count <kMinCount) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
    }
}

-(void)navRightButtonActionAtTag:(NSUInteger)tag{
//    ChangeViewController*changeVC=[[ChangeViewController alloc]init];
//    changeVC.type = QualityPublish;
//    [self.navigationController pushViewController:changeVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 178;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QualityListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QualityListCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QualityListCell" owner:nil options:nil].firstObject;
    }
    NSDictionary *dic = [self.dataArr objectAtSafeIndex:indexPath.row];
    [cell reloadCellData:dic];
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    QualityListModel *model = [self.dataArr objectAtSafeIndex:indexPath.row];//点击第几行 去除对应的model
//    QuaDetailViewController*quaDetailVC=[[QuaDetailViewController alloc]init];
//    //在这里吧列表里面选中的那一行对应的model传到详情页
//    quaDetailVC.selectModel = model;//把和这个model传到详情夜里面
//    quaDetailVC.type=k_Qulity;//质量整改详情页
//    [self.navigationController pushViewController:quaDetailVC animated:YES];
//}

-(IBAction)buttonAction:(UIButton *)sender{
    sender.selected=!sender.selected;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"全部",@"未整改",@"不通过",@"已整改",@"审核不通过",@"审核通过", nil];
    [actionSheet showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
    
    self.button.selected=NO;//恢复到原来的状态
    //state-1  0未整改   1待审核    2已整改    3不合格(这个地方写的state-1(就是buttonIndex-1的意思))
    if (buttonIndex == 6) {//取消按钮的索引值
        return;
    }
    
    //buttonIndex的值 0 全部    1未整改  2待审核  3已整改   4不合格
    
    if (buttonIndex-1 == -1) {//全部
        _state = @"";
    }else{//费全部
        _state = [NSString stringWithFormat:@"%ld",buttonIndex-1];
    }
    [self.tableView.mj_header beginRefreshing];
    
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
