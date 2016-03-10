//
//  ViewController.m
//  iWeather
//
//  Created by Tin Blanc on 3/9/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *unit;

@end

@implementation ViewController
{
    // Khai báo mảng
    NSArray *quotes;
    NSArray *locations;
    NSArray *photoFiles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // thêm phần tử vào mảng
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    
    locations = @[@"Ho Chi Minh, Vietnam", @"Paris, France", @"New York, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
    
}

- (IBAction)updateWeather:(id)sender {
    // biến tạm lấy random một giá trị của quotes.count
    int quoteIndex = (int)arc4random_uniform(quotes.count);
    NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    // Set text location
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    
    // Set image weather icon
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    
    
    if([self.unit.text isEqualToString:@"C"]){
        // Format nhiệt độ + Set nhiệt độ
        NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
        [self.temperature setTitle:string forState:(UIControlStateNormal)];
    }else{
        NSString* s = [NSString stringWithFormat:@"%2.1f", [self getFarenheight]];
        [self.temperature setTitle:s forState:UIControlStateNormal];
    }

    
    
}


// Tạo method trả về nhiệt độ
- (float) getTemperature{
    return 14.0 + arc4random_uniform(18) + (float)arc4random() / (float) INT32_MAX;
}

- (float) getFarenheight{
    return (14.0 + arc4random_uniform(18) + (float)arc4random() / (float) INT32_MAX) * 3;
}

- (IBAction)temperatureTap:(id)sender {
    if([self.unit.text isEqualToString:@"C"]){
        self.unit.text = @"F";
        NSString* s = [NSString stringWithFormat:@"%2.1f", [self getFarenheight]];
        [self.temperature setTitle:s forState:UIControlStateNormal];
    }else{
        self.unit.text = @"C";
        NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
        [self.temperature setTitle:string forState:(UIControlStateNormal)];
    }
}



@end
