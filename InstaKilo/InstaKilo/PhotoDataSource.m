//
//  PhotoDataSource.m
//  InstaKilo
//
//  Created by Mark Meritt on 2016-07-16.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "PhotoDataSource.h"

@implementation PhotoDataSource

NSMutableArray* foundObjects;

-(instancetype)init{
    
    if(self = [super init]){
        _imageArray = [[NSMutableArray alloc] init];
        
      
        
        _imageNames = @[@"apptist", @"blue", @"car", @"driving", @"happy", @"hat", @"hyundai", @"mark19", @"six", @"thehead"];
        
        _groups = @[@"2016", @"2015", @"2012", @"2012", @"2011", @"2012", @"2014", @"2012", @"2001", @"2005"];
        
        _imageNamesandGroups = [[NSDictionary alloc] initWithObjects:_imageNames forKeys:_groups];
        
        for(NSString* name in _imageNames) {
            UIImage *image = [UIImage imageNamed:name];
            [_imageArray addObject:image];
        }
        
    }
    
    return self;
}

-(int)findKeys:(int)section{
    
   
    
    for (int i = 0; i < [self numberOfSections]; i++) {  //for the number of sections in the dictionary
        
        if(i == section){  //stop at the specified section
            
            foundObjects = [NSMutableArray new];  //create the array
            
            for(NSString* str in [_imageNamesandGroups allValues]){  //for all the string values in the keys section
        
                NSString* findString = [_imageNamesandGroups allKeysForObject:str].firstObject;
        
                    if([[_imageNamesandGroups allKeys] containsObject:findString])
                        {
                            
                            [foundObjects addObject:findString];
                            
                        }
        
                    }
            }
    }
    
   
    return (int)foundObjects.count;
     //return the array number
    
}

-(int)numberOfSections{
    
    _uniqueVals = [_groups valueForKeyPath:[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"]];
    
    return (int)_uniqueVals.count;
}


@end
