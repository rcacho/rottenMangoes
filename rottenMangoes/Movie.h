//
//  Movie.h
//  RottenMangoes
//
//  Created by ricardo antonio cacho on 2015-07-22.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MangoRootviewController.h"

@interface Movie : NSObject

@property NSNumber *id;

@property NSString *title;

@property NSNumber *year;

@property NSString *mpaaRating;

@property NSNumber *runtime;

@property NSString *consensus;

@property NSDictionary *releaseDates;

@property NSDictionary *ratings;

@property NSString *synopsis;

@property UIImage *poster;

@property NSArray *cast;

- (instancetype)initWithTitle:(NSString *)title
                  andWithYear:(NSNumber *)year
                andWithRating:(NSString *)rating
               andWithRuntime:(NSNumber *)runtime
             andWithConsensus:(NSString *)consensus
              andWithReleases:(NSDictionary *)releases
               andWithRatings:(NSDictionary *)crtics
              andWithSynopsis:(NSString *)synopsis
               andWithPosters:(NSDictionary *)posters
                  andwithCast:(NSArray *)cast;

@end
