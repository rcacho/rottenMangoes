//
//  MovieHandler.m
//  RottenMangoes
//
//  Created by ricardo antonio cacho on 2015-07-22.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "MovieHandler.h"

@interface MovieHandler ()

@property NSDictionary *movieCollection;

@property NSArray *movies;

@end

@implementation MovieHandler

#pragma mark - NSURL Session Methods

- (void)fetch {
    // call the rotten tomatoes api
    // have other methods create the movie and fix them into the dictionary
    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=55gey28y6ygcr8fjy4ty87ek&page_limit=50";
    

    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            
            NSError *jsonError = nil;
            
            NSDictionary *getResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            self.movies = [getResults objectForKey:@"movies"];
        }
        
        [self buildMovies:self.movies];
        
    }];
    
    [dataTask resume];
    

}

- (void)buildMovies:(NSArray *)movies {
    NSMutableArray *listOfMovies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *movieDict in movies) {
        Movie *aMovie = [[Movie alloc] initWithTitle:[movieDict objectForKey:@"title"] andWithYear:[movieDict objectForKey:@"year"] andWithRating:[movieDict objectForKey:@"mpaa_rating"] andWithRuntime:[movieDict objectForKey:@"runtime"] andWithConsensus:[movieDict objectForKey:@"critics_consensus"] andWithReleases:[movieDict objectForKey:@"release_dates"] andWithRatings:[movieDict objectForKey:@"ratings"] andWithSynopsis:[movieDict objectForKey:@"synopsis"] andWithPosters:[movieDict objectForKey:@"posters"] andwithCast:[movieDict objectForKey:@"abridged_cast"]];
        
        [listOfMovies addObject:aMovie];
    }
    
    // organize in the dictionary.....
    // try organizing them by their ratings
    // for now....
    
    self.movieCollection = [[NSDictionary alloc] initWithObjectsAndKeys:listOfMovies,@"movies", nil];
    [self.viewController reloadData];
    
}

#pragma mark - collection Methods

- (NSInteger)numberOfSections {
    return self.movieCollection.allKeys.count;
}

- (NSInteger)numberOfRowsForSection:(NSInteger)section {
    return [self.movieCollection.allValues[section] count];
}

- (NSString *)titleForHeaderInSection:(NSInteger)section {
    return self.movieCollection.allKeys[section];
}

- (Movie*)objectAtIndex:(NSIndexPath *)indexPath {
    return self.movieCollection.allValues[indexPath.section][indexPath.row];
}

@end
