//
//  TableViewCell.h
//  Demo
//
//  Created by KevinLu on 16/9/28.
//  Copyright © 2016年 KevinLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DTCoreText.h>
@interface TableViewCell : DTAttributedTextCell<DTAttributedTextContentViewDelegate,DTLazyImageViewDelegate>
@property (weak, nonatomic) IBOutlet DTAttributedTextView *textView;
@end
