//
//  ViewController.m
//  UPPhotoAndVideo
//
//  Created by ZPP on 2018/3/26.
//  Copyright © 2018年 ZZP. All rights reserved.
//

#import "ViewController.h"
#import "ACMediaFrame.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ACSelectMediaView *mediaView = [[ACSelectMediaView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 1)];
    
    // 需要展示的媒体的资源类型，当前是仅本地图库
    mediaView.type = ACMediaTypeAll;
    
    // 是否允许 同个图片或视频进行多次选择
    mediaView.allowMultipleSelection = NO;
    
    //视情况看是否需要改变高度，目前单独使用且作为tableview的header，并不用监控并改变高度
    [mediaView observeViewHeight:^(CGFloat mediaHeight) {
    
    }];
    
    // 随时获取选择好媒体文件
    [mediaView observeSelectedMediaArray:^(NSArray<ACMediaModel *> *list) {
        // do something
        for (ACMediaModel *model in list) {
            //遍历得到模型中想要的数据  e.g.
             id uplodaType = model.uploadType;
             NSString *name = model.name;
        }
        NSLog(@"list.count = %lu",(unsigned long)list.count);
    }];
    
    //刷新方法 在 observeViewHeight 存在时可忽略
    [mediaView reload];
    
    // 添加到控件上
    [self.view addSubview:mediaView];
//    self.view = mediaView;
 
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
