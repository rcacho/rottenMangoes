//
//  MovieViewCell.m
//  RottenMangoes
//
//  Created by ricardo antonio cacho on 2015-07-22.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "MovieViewCell.h"

@interface MovieViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;


@end

@implementation MovieViewCell

- (void)setMovieForCell:(Movie *)movieForCell {
    _movieForCell = movieForCell;
    [self setContent];
}

- (void)setContent {
    // something should be done about the lag here?
    
    self.ratingLabel.text = [NSString stringWithFormat:@"%@\%%",[self.movieForCell.ratings objectForKey:@"critics_score"]];
    self.movieTitleLabel.text = self.movieForCell.title;
    self.posterImageView.image = self.movieForCell.poster;
}



@end
