

//
//  MyProfileViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/22.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "MyProfileViewController.h"
#import "HeadTableViewCell.h"
#import "InformationTableViewCell.h"

@interface MyProfileViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
    UIImage    *_image;
}

@property(nonatomic,strong) UIImagePickerController   *imagePickerController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;

//变量
@property (assign, nonatomic) BOOL      isHaveEdit;
@property (assign, nonatomic) NSInteger imageTotalCount;
@property (assign, nonatomic) NSInteger num;
@property (assign, nonatomic) NSInteger upLoadIndex;

@end

@implementation MyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"我的资料";
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSArray*array=@[@{@"title":@"姓名:",@"type":@"0"},
                    @{@"title":@"性别:",@"type":@"1"},
                    @{@"title":@"年龄:",@"type":@"2"},
                    @{@"title":@"电话:",@"type":@"3"},
                    @{@"title":@"身份证:",@"type":@"4"},
                    @{@"title":@"地址:",@"type":@"5"},
                    ];
    [self.dataArr addObjectsFromArray:array];
    
    [self registerNotification];//注册键盘通知
}
-(void)registerNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return self.dataArr.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 160;
    }
    return 46;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        HeadTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"HeadTableViewCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"HeadTableViewCell" owner:nil options:nil].firstObject;
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        __weak typeof (self)this=self;
        cell.changeHeadImageBlock = ^(NSInteger tag) {
            [this chooseImage:nil];
        };
        [cell reloadCelldata:indexPath Withimage:_image];
//        [cell reloadCelldata:indexPath WithUserAvatarUrl:_image];
        return cell;
    }else{
        InformationTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"InformationTableViewCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"InformationTableViewCell" owner:nil options:nil].firstObject;
        }
        NSDictionary*dic=[self.dataArr objectAtSafeIndex:indexPath.row];
        [cell reloadCelldata:dic WithTitle:nil WithIndexPath:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }

}
#pragma mark keyboard
- (void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary*info=[notification userInfo];
    CGSize keyboardSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    self.tableView.contentInset= UIEdgeInsetsMake(0,0, keyboardSize.height,0);
}
-(void)keyboardWillHide:(NSNotification*)notification{
    self.tableView.contentInset= UIEdgeInsetsZero;
}
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (IBAction)buttonAction:(UIButton *)sender {
    [self.tableView endEditing:YES];
    
}

#pragma mark - UIImagePickerControllerDelegate
- (IBAction)chooseImage:(id)sender {
    // 创建UIImagePickerController实例
    _imagePickerController = [[UIImagePickerController alloc] init];
    // 设置代理
    _imagePickerController.delegate = self;
    // 是否允许编辑（默认为NO）
    _imagePickerController.allowsEditing = YES;
    // 创建一个警告控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    // 设置警告响应事件
    __weak typeof(self) this = self;
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //        // 设置照片来源为相机
        
        [this actionSheetWithTag:0];
    }];
    UIAlertAction *photosAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //        this.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //        [self presentViewController:this.imagePickerController animated:YES completion:^{}];
        [this actionSheetWithTag:1];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){// 添加警告按钮
        [alert addAction:cameraAction];
    }
    [alert addAction:photosAction];
    [alert addAction:cancelAction];
    // 展示警告控制器
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)actionSheetWithTag:(NSInteger)tag{
    switch (tag) {
        case 0:{
            //从相机选择
            BOOL isSourceTypePhotoLibrary = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
            if (isSourceTypePhotoLibrary){
                UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
                imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePickerController.delegate = self;
                
                [self presentViewController:imagePickerController animated:YES completion:nil];
            }
            break;
        }
        case 1:{
            ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
            if (author == ALAuthorizationStatusDenied)
            {
                [MBProgressHUD showMessage:@"请在设备的设置-隐私-相机中允许访问相册。"];
            }
            else
            {
                QBImagePickerController *imagePickerController = [[QBImagePickerController alloc] init];
                imagePickerController.delegate = self;
                imagePickerController.sourceViewController = KPhotoShopNum;
                imagePickerController.allowsMultipleSelection = YES;
                imagePickerController.navigationController.delegate=self;
                imagePickerController.limitsMaximumNumberOfSelection = YES;
                imagePickerController.showsCancelButton = NO;
                imagePickerController.minimumNumberOfSelection = 1;
                imagePickerController.filterType = QBImagePickerFilterTypeAllAssets;//默认
                //cameraAssetsURLs.count 相机的数目
                imagePickerController.maximumNumberOfSelection = 1;
                imagePickerController.maxTotalNumberOfSelection = 1;
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
                [self presentViewController:navigationController animated:YES completion:NULL];
            }
        }
        default:
            break;
    }
}
//从相册里面选择
- (void)imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingMediaWithInfos:(id)info{
    NSArray *mediaInfoArray = nil;
    _isHaveEdit = NO;
    if ([info isKindOfClass:[NSDictionary class]])
    {
        mediaInfoArray = [NSArray arrayWithObject:info];
    }
    else if ([info isKindOfClass:[NSArray class]])
    {
        mediaInfoArray = (NSArray *)info;
    }
    //照片为空 什么都不做
    if ([mediaInfoArray count]<=0)
    {
        [imagePickerController dismissViewControllerAnimated:YES completion:NULL];
        return;
    }
    //保存图片数量
    dispatch_queue_t globalQueue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.imageTotalCount += mediaInfoArray.count;
    [MBProgressHUD showMessage:@"正在上传..."];
    
    for (int i=0; i<mediaInfoArray.count; i++) {
        NSDictionary*dic=[mediaInfoArray objectAtIndex:i];
        _image=[dic objectForKey:UIImagePickerControllerOriginalImage];
        //上传图片  异步执行
        dispatch_async(globalQueue, ^{//发起上传网络请求
            
        });
    }
    [self.tableView reloadData];
    [imagePickerController dismissViewControllerAnimated:YES completion:nil];
    
}
//拍照
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    ALAssetsLibrary* alLibrary = [[ALAssetsLibrary alloc] init];
    
    [alLibrary assetForURL:[info objectForKey:UIImagePickerControllerReferenceURL]
               resultBlock:^(ALAsset *asset){
                   ALAssetRepresentation *representation = [asset defaultRepresentation];
                   if ([representation size] > 1024*1024*2){
                       UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"图片超出了2M，请重新选择" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                       alert.tag = 100;
                       [alert show];
                       
                       //                       [self setretakeButtonEnable:picker];
                       return;
                   }else{
                       UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
                       [self didFinishEdittingWith:image];
                       self.imageTotalCount += 1;
                       [self dismissModalViewControllerAnimated:YES];
                   }
               }
              failureBlock:^(NSError *error){
              }];
}
#pragma mark - 编辑完成后
-(void)croppedImageFinish:(NSNotification *)notif
{
    NSDictionary *dic=notif.object;
    
    //    NSString *imageType =[dic objectForKey:@"type"];
    NSString *croppedUrl=[dic objectForKey:@"image"];
    UIImage  *croppedImage=[[SDImageCache sharedImageCache] imageFromDiskCacheForKey:croppedUrl];
    NSInteger index=[[dic objectForKey:@"index"] integerValue];
    NSData * imagedata = UIImageJPEGRepresentation(croppedImage, 0.1);
    UIImage * aimage = [UIImage imageWithData:imagedata];
    _upLoadIndex=index;
    _isHaveEdit=YES;
    [self didFinishEdittingWith:aimage];
    
}
//编辑完成后上传
- (void)didFinishEdittingWith:(UIImage *)image
{
    [MBProgressHUD showMessage:@"正在上传"];
  
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
