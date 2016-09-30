//
//  BookViewController.m
//  Demo
//
//  Created by KevinLu on 16/9/27.
//  Copyright © 2016年 KevinLu. All rights reserved.
//

#import "BookViewController.h"

@interface BookViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.text = @"<html><body><p>hello world</p></body></html>";
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
/*
    <p>我是新手怎么入门</p><p><img src="/uploads/ueditor/img/2016/9/27/63ed6431-be43-449e-a270-2c97aede15ce.jpg" title="63ed6431-be43-449e-a270-2c97aede15ce.jpg" alt="dan.jpg"/></p><p>搞基哪家强？</p><p><img src="/uploads/ueditor/img/2016/9/27/58f00c06-627e-4c5c-9678-0c62503cf90c.jpg" title="58f00c06-627e-4c5c-9678-0c62503cf90c.jpg" alt="jiyuan.jpg"/></p>
 */

@end
