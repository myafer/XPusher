//
//  ViewController.h
//  XPusher
//
//  Created by Afer on 16/10/18.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSPopUpButton *selectButton;
@property (weak) IBOutlet NSTextField *deviceTokenTextField;
@property (weak) IBOutlet NSTextField *payLoadTextField;
@property (weak) IBOutlet NSButton *devButton;
@property (weak) IBOutlet NSButton *pubButton;

@end

