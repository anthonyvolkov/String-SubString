//
//  ViewController.m
//  CodeJam_02_String-SubString
//
//  Created by anthony volkov on 4/19/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import "ViewController.h"
#import "StringToArrayOfSubstrings.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//------------------------------------------------------------test data------------------------------------------------------------
    
    NSString *string1 = @"Prime Minister <Narendra Modi> tweeted a <link> to the speech (Human Resource Development Minister Smriti Irani) <made> in the Lok Sabha during the ((debate) on the ongoing JNU row) and the suicide of Dalit scholar Rohith Vemula at the [Hyderabad Central University].";
    
    NSString *string2 = @"Lorem <(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet>. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget (nulla. Class aptent <taciti [sociosqu ad] litora torquent per conubia> nostra), per inceptos himenaeos.";
    
//------------------------------------------------------------test data------------------------------------------------------------
    
    
    NSLog(@"%@", [StringToArrayOfSubstrings arrayOfSubstringsInBrackets:string1]);
    NSLog(@"%@", [StringToArrayOfSubstrings arrayOfSubstringsInBrackets:string2]);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
