//
//  ViewController.m
//  headertest
//
//  Created by yxn on 16/7/23.
//  Copyright © 2016年 yxn. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet MyView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    self.tableview.backgroundColor = [UIColor lightGrayColor];
    
    [self.tableview addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];

    
    
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    self.headerView.backgroundColor =[UIColor redColor];
    [self.view bringSubviewToFront:self.headerView];
    // Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"])
    {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y <= 0 && -offset.y >= 64) {
            
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
            self.headerView.frame = newFrame;
            if (-offset.y <=200)
            {
                self.tableview.contentInset = UIEdgeInsetsMake(-offset.y, 0, 0, 0);
            }
        } else {
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, 64);
            self.headerView.frame = newFrame;
            self.tableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        }
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
