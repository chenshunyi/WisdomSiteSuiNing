
//
//  AddressViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
}
@property(nonatomic,strong) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray*nameArr;//项目经理等等


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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 52.5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    AddressTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"AddressTableViewCell"];
//    if (!cell) {
//        cell = [[NSBundle mainBundle]loadNibNamed:@"AddressTableViewCell" owner:nil options:nil].firstObject;
//    }
//    DepartmentModel*departModel=[self.dataArr objectAtSafeIndex:indexPath.row];
//
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//
//
//
//    [cell reloadCellWithDepartment:departModel WithIIndexPath:indexPath];
//
//    return cell;
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=[NSString stringWithFormat:@"我是第%ld个页面的cell",tableView.tag+1];
    return cell;
    
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
