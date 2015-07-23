//
//  Movie.m
//  RottenMangoes
//
//  Created by ricardo antonio cacho on 2015-07-22.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "Movie.h"


@implementation Movie

- (instancetype)initWithTitle:(NSString *)title
                  andWithYear:(NSNumber *)year
                andWithRating:(NSString *)rating
               andWithRuntime:(NSNumber *)runtime
             andWithConsensus:(NSString *)consensus
              andWithReleases:(NSDictionary *)releases
               andWithRatings:(NSDictionary *)crtics
              andWithSynopsis:(NSString *)synopsis
               andWithPosters:(NSDictionary *)posters
                  andwithCast:(NSArray *)cast
{
    self = [super init];
    if (self) {
        // may we could just get the poster we need...
        _title = title;
        _year = year;
        _mpaaRating = rating;
        _runtime = runtime;
        _consensus = consensus;
        _releaseDates = releases;
        _ratings = crtics;
        _synopsis = synopsis;
        // should the actual image rather than string fir the url
        _cast = cast;
        
       [Movie setImage:[posters objectForKey:@"thumbnail"] forMovie:self];
    }
    return self;
}

+ (void)setImage:(NSString *)urlAsString forMovie:(Movie *)aMovie {
    

    
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession] downloadTaskWithURL:[NSURL URLWithString:urlAsString] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
      
        UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        
        aMovie.poster = downloadedImage;
    
   }];
    
    [downloadPhotoTask resume];
}

@end
