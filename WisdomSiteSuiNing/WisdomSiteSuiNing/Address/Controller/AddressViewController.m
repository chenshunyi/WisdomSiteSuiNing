
//
//  AddressViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "AddressViewController.h"
#import "AddrDetailTableViewCell.h"
#import "AddressHeaderFooterView.h"

@interface AddressViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray     *_array;
    NSDictionary*_data;
    BOOL _isOpen[50];
    
}
@property(nonatomic,strong) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray*nameArr;//项目经理等等


@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"通讯录";
     [self setNavBackButton:@"green_contruction.png"];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.nameArr=@[@{@"title":@"技术部",@"datas":@[@{@"name":@"张三",@"phone":@"1234566"},@{@"name":@"范冰冰",@"phone":@"1234566"},@{@"name":@"李晨",@"phone":@"1234566"}]},
                    @{@"title":@"项目经理",@"datas":@[@{@"name":@"张四",@"phone":@"1234566"},@{@"name":@"范冰冰",@"phone":@"1234566"},@{@"name":@"李晨",@"phone":@"1234566"}]},
                    @{@"title":@"后期部",@"datas":@[@{@"name":@"张五",@"phone":@"1234566"},@{@"name":@"范冰冰",@"phone":@"1234566"},@{@"name":@"李晨",@"phone":@"1234566"}]}
                    ];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.nameArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *data=[self.nameArr objectAtSafeIndex:section];
    NSArray *datas = [data objectForKey:@"datas"];
    if (_isOpen[section]) {
        return datas.count;
    }else{
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 52.5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddrDetailTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"AddrDetailTableViewCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"AddrDetailTableViewCell" owner:nil options:nil].firstObject;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    NSDictionary*data=[self.nameArr objectAtSafeIndex:indexPath.row];
    [cell reloadCellData:data withHeadImageUrl:nil];

    return cell;
    
//    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    cell.textLabel.text=[NSString stringWithFormat:@"我是第%ld个页面的cell",tableView.tag+1];
//    return cell;
    
}

#pragma mark UITableViewDelegate回调方法
//对hearderView进行编辑
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    AddressHeaderFooterView *view = [[NSBundle mainBundle]loadNibNamed:@"AddressHeaderFooterView" owner:nil options:nil].firstObject;
    if (!view) {
        view = [[NSBundle mainBundle]loadNibNamed:@"AddressHeaderFooterView" owner:nil options:nil].firstObject;
//        view.reuseIdentifier = @"AddressHeaderFooterView";
    }
    __weak typeof(self) this = self;
    [view setUnfolderButtonClickBlock:^(NSInteger section) {
        self->_isOpen[section] = !self->_isOpen[section];
        //NSIndexSet 索引集合
        NSIndexSet *indexSet =[NSIndexSet indexSetWithIndex:section];
        //刷新区
        [this.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    
    NSDictionary *data = [_nameArr objectAtSafeIndex:section];
    [view reloadHeaderFooterView:data withUnfolder:_isOpen[section] withSection:section];
    

    return view;
    
}
//设置headerView高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
//button的响应点击事件
- (void) buttonClicked:(UIButton *) sender {
    //改变模型数据里面的展开收起状态
//
//
//    YYMGroup *group2 = dataArray[sender.tag - 200];
//    group2.folded = !group2.isFolded;
//    [myTableView reloadData];
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
