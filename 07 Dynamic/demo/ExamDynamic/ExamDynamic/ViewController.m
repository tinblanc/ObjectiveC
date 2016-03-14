//
//  ViewController.m
//  ExamDynamic
//
//  Created by Tin Blanc on 3/14/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@end


#pragma mark - Animals
@interface cat : NSObject
@end
@implementation cat
-(NSString*) result{
    return @"cat.png";
}
@end

@interface dog : NSObject
@end

@implementation dog
-(NSString*) result{
    return @"dog.png";
}
@end

@interface tiger : NSObject
@end
@implementation tiger
-(NSString*) result{
    return @"tiger.png";
}
@end


#pragma mark - Main Logic
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _btnSubmit.layer.borderWidth = 0.5;
    _btnSubmit.layer.cornerRadius = 2;
}

- (IBAction)btnSubmit:(id)sender {
    NSArray* animals = @[@"cat", @"dog", @"tiger"];
    
    // Check nil
    Class class = NSClassFromString(self.name.text);
    if(class == nil){
        self.message.text = @"No exist";
        _image.image = nil;
        return;
    }
    
    id object = [class new];
    SEL callMethod = @selector(result);
    
    if([object respondsToSelector:callMethod]){
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        _image.image = [UIImage imageNamed:[object performSelector:callMethod]] ;
        #pragma clang diagnostic pop
        _message.text = nil;
        
    }
    
    
    
}

@end
