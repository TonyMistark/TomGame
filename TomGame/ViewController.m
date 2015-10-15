//
//  ViewController.m
//  TomGame
//
//  Created by 弥超 on 15/9/7.
//  Copyright (c) 2015年 弥超. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomImageView;

@end

@implementation ViewController
- (IBAction)touchHeadOnClick:(UIButton *)sender {
    //1.首先创建图片数组
    NSMutableArray *tomImages = [NSMutableArray array];
    NSLog(@"lallal");
    for (int i=0;i<81;i++){//cat_knockout0000.jpg
        NSString *count=0;
        if (i < 10){
            count = [NSString stringWithFormat:@"0%d",i];
        }else{
            count = [NSString stringWithFormat:@"%d",i];
        }
        NSString *imageName = [NSString stringWithFormat:@"%@%@.jpg",@"cat_knockout00",count];
        NSLog(@"%@",imageName);
//        UIImage *image = [UIImage imageNamed:imageName];//据说在图片很多的情况下会导致内存溢出
        //这种方式获取图片不会有内存溢出的问题
        NSString *path = [[NSBundle mainBundle]pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [tomImages addObject:image];
    }
    //2.1设置动画过程，添加动画执行的图片数组
    [self.tomImageView setAnimationImages:tomImages];
    
    //2.2设置动画执行的时间
    [self.tomImageView setAnimationDuration:self.tomImageView.animationImages.count * 0.1];
    //2.3动画执行的次数
    [self.tomImageView setAnimationRepeatCount:1];
    //2.4设置动画开始执行
    [self.tomImageView startAnimating];
    //3.1在动画结束之后清空数组
//    [self performSelector:@selector(clearImages) withObject:nil afterDelay:self.tomImageView.animationDuration];
    [self.tomImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomImageView.animationDuration];
    
}
//-(void)clearImages{
//    self.tomImageView.animationImages = nil;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
