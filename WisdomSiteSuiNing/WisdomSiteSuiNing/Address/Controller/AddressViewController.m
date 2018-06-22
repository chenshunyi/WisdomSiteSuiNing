
//
//  AddressViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "AddressViewController.h"
#import "AddrDetailTableViewCell.h"

@interface AddressViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray     *_array;
    NSDictionary*_data;
}
@property(nonatomic,strong) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray*nameArr;//项目经理等等

@property (nonatomic, assign, getter=isFolded) BOOL folded;


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
    
    self.folded=YES;

    
    self.nameArr=@[@{@"title":@"技术部",@"datas":@[@{@"name":@"张三",@"phone":@"1234566"},@{@"name":@"范冰冰",@"phone":@"1234566"},@{@"name":@"李晨",@"phone":@"1234566"}]},
                    @{@"title":@"项目经理",@"datas":@[@{@"name":@"张四",@"phone":@"1234566"},@{@"name":@"范冰冰",@"phone":@"1234566"},@{@"name":@"李晨",@"phone":@"1234566"}]},
                    @{@"title":@"后期部",@"datas":@[@{@"name":@"张五",@"phone":@"1234566"},@{@"name":@"范冰冰",@"phone":@"1234566"},@{@"name":@"李晨",@"phone":@"1234566"}]}
                    ];
    for (int i=0; i<self.nameArr.count; i++) {
        _data=[self.nameArr objectAtSafeIndex:i];
        _array=[_data objectForKey:@"name"];
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.nameArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
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
    UIView*nameView=[[UIView alloc]init];
     //将分组的名字nameLabel添加到nameview上
    UILabel*nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 0, self.view.frame.size.width, 40)];
    [nameView addSubview:nameLabel];
    nameView.layer.borderWidth=0.2;
    nameView.layer.borderColor=[UIColor grayColor].CGColor;
    nameLabel.text=[_data objectForKey:@"title"];
    //添加一个button用于响应点击事件（展开还是收起）
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, self.view.frame.size.width, 40);
    [nameView addSubview:button];
    button.tag = 200 + section;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    //将显示展开还是收起的状态通过三角符号显示出来
    UIImageView *fuhao=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    fuhao.tag=section;
    [nameView addSubview:fuhao];
    return nameView;
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
