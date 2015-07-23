//
//  MovieHandler.h
//  RottenMangoes
//
//  Created by ricardo antonio cacho on 2015-07-22.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"
#import "MangoRootviewController.h"

@interface MovieHandler : NSObject

@property MangoRootviewController *viewController;

- (void)fetch;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsForSection:(NSInteger)section;

- (NSString *)titleForHeaderInSection:(NSInteger)section;

- (Movie*)objectAtIndex:(NSIndexPath *)indexPath;

@end
