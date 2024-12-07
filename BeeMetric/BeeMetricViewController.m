//
//  BeeMetricViewController.m
//  BeeMetric
//
//  Created by BeeMetric on 2024/11/20.
//

#import "BeeMetricViewController.h"

@interface BeeMetricViewController ()

@property (weak, nonatomic) IBOutlet UILabel *beeMetricTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *beeMetricDesLabel;
@property (weak, nonatomic) IBOutlet UILabel *beeLabel;
@property (weak, nonatomic) IBOutlet UILabel *metricLabel;
@property (weak, nonatomic) IBOutlet UITextField *beeTextField;
@property (weak, nonatomic) IBOutlet UITextField *metricTextField;
@property (weak, nonatomic) IBOutlet UIView *royalJellyView;
@property (weak, nonatomic) IBOutlet UIView *beeswaxView;
@property (weak, nonatomic) IBOutlet UIImageView *pollenView;
@property (weak, nonatomic) IBOutlet UILabel *corridorsLabel;


@end

@implementation BeeMetricViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _beeMetricTitleLabel.text = @[NSLocalizedString(@"beeMetText1", nil),
                                  NSLocalizedString(@"beeMetText2", nil),
                                  NSLocalizedString(@"beeMetText3", nil)][_beeMetricIndex];
    _corridorsLabel.text = @[NSLocalizedString(@"beeMetText4", nil),
                             NSLocalizedString(@"beeMetText5", nil),
                             NSLocalizedString(@"beeMetText6", nil)][_beeMetricIndex];
    _beeMetricDesLabel.text = @[NSLocalizedString(@"beeMetText7", nil),
                                NSLocalizedString(@"beeMetText8", nil),
                                NSLocalizedString(@"beeMetText9", nil)][_beeMetricIndex];
    _beeLabel.text = @[NSLocalizedString(@"beeMetText10", nil),
                       NSLocalizedString(@"beeMetText11", nil),
                       NSLocalizedString(@"beeMetText12", nil)][_beeMetricIndex];
    _metricLabel.text = @[NSLocalizedString(@"beeMetText13", nil),
                          NSLocalizedString(@"beeMetText14", nil),
                          NSLocalizedString(@"beeMetText15", nil)][_beeMetricIndex];
    
    [self.beeTextField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
    [self.metricTextField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
    
    self.royalJellyView.layer.cornerRadius = 35;
    self.royalJellyView.layer.borderWidth = 3.0;
    self.royalJellyView.layer.borderColor = [UIColor blackColor].CGColor;
    self.beeswaxView.layer.cornerRadius = 28;
    self.beeswaxView.layer.borderWidth = 3.0;
    self.beeswaxView.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.pollenView.image = [UIImage imageNamed:[NSString stringWithFormat:@"PollenSource_%ld", self.beeMetricIndex+1]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)beeMetricDis:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)calculateAction:(UIButton *)sender {
    [self.view endEditing:YES];
    if (!_beeTextField.text.length) {
        return;
    }
    if (!_metricTextField.text.length) {
        return;
    }
    NSString *beeMetricString;
    if (_beeMetricIndex == 0) {
        beeMetricString = [NSString stringWithFormat:@"Hive area requirement (m²)= %.1f", _beeTextField.text.floatValue * _metricTextField.text.floatValue];
    }else if (_beeMetricIndex == 1) {
        beeMetricString = [NSString stringWithFormat:@"Heating power (W)=  %.1f", _beeTextField.text.floatValue * _metricTextField.text.floatValue];
    }else {
        beeMetricString = [NSString stringWithFormat:@"Honey source area (㎡)= %.1f", _beeTextField.text.floatValue * _metricTextField.text.floatValue];
    }
    UIAlertController *beeAlertController = [UIAlertController alertControllerWithTitle:@"Result" message:beeMetricString preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:nil];
    [beeAlertController addAction:action];
    [self presentViewController:beeAlertController animated:YES completion:nil];
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
