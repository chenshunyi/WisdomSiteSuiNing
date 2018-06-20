//
//  EditPictureViewController.m
//  TaoFang
//
//  Created by user on 15/9/22.
//  Copyright (c) 2015年 House365. All rights reserved.
//

#import "EditPictureViewController.h"
#import "PECropView.h"
#import "EditPictureView.h"
#import <SDImageCache.h>
#import "NSData+MD5Digest.h"
@interface EditPictureViewController ()<EditPictureViewDelegate>
@property (nonatomic,retain) PECropView *cropView;
@property (nonatomic,retain) UIImage *resultImage;
@property (nonatomic,retain) UIImage *rotationImage;
@end

@implementation EditPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor blackColor];
    [self setNavTitle:@"编辑图片"];
    [self initView];
    [self initData];
    
    
    
    
   
}
-(void)initData
{
    UIImage *cacheimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:self.urlStr];
    if (cacheimage )
    {
        self.image=cacheimage;
        self.cropView.image=cacheimage;
        
        return;
    }
    UIImageFromURL( [NSURL URLWithString:self.urlStr], ^( UIImage * image )
                   {
                       self.image=image;
                       self.cropView.image=image;
                       //将图片缓存
                       [[SDImageCache sharedImageCache] storeImage:image forKey:self.urlStr completion:nil];
//                       [[SDImageCache sharedImageCache] storeImage:image forKey:self.urlStr];
                       
                       
                   }, ^(void){
                       NSLog(@"error!");
                   });

    
}
-(void)initView
{
    self.cropView = [[PECropView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50)];
    self.cropView.image=self.image;
    [self.view addSubview:self.cropView];
    EditPictureView *editView=[[EditPictureView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50-64, self.view.frame.size.width, 50)];
    editView.delegate=self;
    
    [self.view addSubview:editView];
}

void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void) )
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:URL];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}


-(void)cancelEditView:(EditPictureView *)editView
{
    self.cropView.image=self.image;
}
-(void)editView:(EditPictureView *)editView
{
    self.resultImage=self.cropView.croppedImage;
    self.cropView.image=self.resultImage;
}
-(void)leftRotationEditView:(EditPictureView *)editView
{
    self.cropView.isRotationLeft=YES;
    self.cropView.isRotationRight=NO;
    UIImage *image=[self.cropView getRotationImage];
    self.cropView.image=image;
//    self.resultImage=image;
}
-(void)rightRotationEditView:(EditPictureView *)editView
{
     self.cropView.isRotationRight=YES;
     self.cropView.isRotationLeft=NO;
     UIImage *image=[self.cropView getRotationImage];
     self.cropView.image=image;
//     self.resultImage=image;
    
}
-(void)finishEditView:(EditPictureView *)editView
{

    if (self.resultImage==nil)
    {
        self.resultImage=self.cropView.croppedImage;
        self.cropView.image=self.resultImage;
    }
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    NSData *imageData = UIImageJPEGRepresentation(self.resultImage, 1.0);
    NSString *path = [NSString stringWithFormat:@"%@_%d",[NSData MD5HexDigest:imageData],self.index];
    [[SDImageCache sharedImageCache]storeImage:self.resultImage forKey:path completion:nil];
    [dic setValue:path forKey:@"image"];
    [dic setValue:[NSString stringWithFormat:@"%d",self.index] forKey:@"index"];
    [dic setValue:self.imgType forKey:@"type"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"editPicture" object:dic];
    [_delegate croppedImageFinish:dic];
    [self.navigationController popViewControllerAnimated:YES];
    
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
