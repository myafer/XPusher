//
//  ViewController.m
//  XPusher
//
//  Created by Afer on 16/10/18.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import "ViewController.h"

#import "NWHub.h"
#import "NWNotification.h"
#import "NWPushFeedback.h"
#import "NWPusher.h"
#import "NWSSLConnection.h"
#import "NWSecTools.h"

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _devButton.state = 1;
    [self loadCertificatesFromKeychain];
}

- (void)loadCertificatesFromKeychain {
    NSError *error = nil;
    NSArray *certs = [NWSecTools keychainCertificatesWithError:&error];
    if (!certs) {
        NWLogWarn(@"Unable to access keychain: %@", error.localizedDescription);
    }
    if (!certs.count) {
        NWLogWarn(@"No push certificates in keychain.");
    }
    certs = [certs sortedArrayUsingComparator:^NSComparisonResult(NWCertificateRef a, NWCertificateRef b) {
        NWEnvironmentOptions envOptionsA = [NWSecTools environmentOptionsForCertificate:a];
        NWEnvironmentOptions envOptionsB = [NWSecTools environmentOptionsForCertificate:b];
        if (envOptionsA != envOptionsB) {
            return envOptionsA < envOptionsB;
        }
        NSString *aname = [NWSecTools summaryWithCertificate:a];
        NSString *bname = [NWSecTools summaryWithCertificate:b];
        return [aname compare:bname];
    }];
    NSMutableArray *pairs = @[].mutableCopy;
    for (NWCertificateRef c in certs) {
        [pairs addObject:@[c, NSNull.null]];
    }
//    _certificateIdentityPairs = [_certificateIdentityPairs arrayByAddingObjectsFromArray:pairs];
}



- (IBAction)buttonPressed:(NSPopUpButton *)sender {
    
}

- (IBAction)checkButtonPressed:(NSButton *)sender {
    
}

- (IBAction)pushButtonPressed:(id)sender {
    
}

@end
