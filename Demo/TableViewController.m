//
//  TableViewController.m
//  Demo
//
//  Created by KevinLu on 16/9/28.
//  Copyright © 2016年 KevinLu. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
NSString * const AttributedTextCellReuseIdentifier = @"AttributedTextCellReuseIdentifier";
@interface TableViewController ()
{
    NSCache *cellCache;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cellCache = [[NSCache alloc] init];
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (BOOL)_canReuseCells
{
    // reuse does not work for variable height
    
    if ([self respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])
    {
        return NO;
    }
    
    // only reuse cells with fixed height
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView preparedCellForIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.row];
    TableViewCell *cell = [cellCache objectForKey:key];
    if (!cell)
    {
        if ([self _canReuseCells])
        {
            cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:AttributedTextCellReuseIdentifier];
        }
        
        if (!cell)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:AttributedTextCellReuseIdentifier];
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.hasFixedRowHeight = NO;
        
        // cache it, if there is a cache
        [cellCache setObject:cell forKey:key];
    }
    
    [self configureCell:cell forIndexPath:indexPath];
    return cell;
}
- (void)configureCell:(TableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
//    NSDictionary *snippet = [_snippets objectAtIndex:indexPath.row];
    
//    NSString *title = [snippet objectForKey:@"Title"];
//    NSString *description = [snippet objectForKey:@"Description"];
    
    NSString *html = [NSString stringWithFormat:@"<p>我是新手怎么入门</p><p><img src=\"http://dev.microoh.com:70/uploads/ueditor/img/2016/9/27/63ed6431-be43-449e-a270-2c97aede15ce.jpg\" title=\"63ed6431-be43-449e-a270-2c97aede15ce.jpg\" alt=\"dan.jpg\"/></p><p>搞基哪家强？</p><p><img src=\"http://dev.microoh.com:70/uploads/ueditor/img/2016/9/27/58f00c06-627e-4c5c-9678-0c62503cf90c.jpg\" title=\"58f00c06-627e-4c5c-9678-0c62503cf90c.jpg\" alt=\"jiyuan.jpg\"/></p>"];
    
//    [cell setHTMLString:html];
    NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *string = [[NSAttributedString alloc] initWithHTMLData:data options:nil documentAttributes:NULL];
    cell.textView.attributedString = string;
    cell.attributedTextContextView.shouldDrawImages = YES;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell *cell = (TableViewCell *)[self tableView:tableView preparedCellForIndexPath:indexPath];
    
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = (TableViewCell *)[self tableView:tableView preparedCellForIndexPath:indexPath];
    return cell;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
