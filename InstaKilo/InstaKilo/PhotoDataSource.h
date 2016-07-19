//
//  PhotoDataSource.h
//  InstaKilo
//
//  Created by Mark Meritt on 2016-07-16.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotoDataSource : NSObject

@property (nonatomic) NSDictionary *imageNamesandGroups;
@property (nonatomic) NSArray *groups;
@property (nonatomic) NSArray *uniqueVals;
@property (nonatomic) NSArray *imageNames;
@property (nonatomic) NSMutableArray *imageArray;

-(int)findKeys: (int)section;
-(int)numberOfSections;
@end
