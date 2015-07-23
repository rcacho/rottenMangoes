//
//  MangoRootviewController.m
//  RottenMangoes
//
//  Created by ricardo antonio cacho on 2015-07-22.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "MangoRootviewController.h"
#import "MovieHandler.h"
#import "MovieViewCell.h"
#import "MovieDetalViewController.h"

@interface MangoRootviewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property MovieHandler *movies;

@property Movie *selectedMovie;

@end

@implementation MangoRootviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // initialize the handler here....
    self.movies = [[MovieHandler alloc] init];
    self.movies.viewController = self;
   
    
    [self.movies fetch];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"movieDetails"]) {
        [segue.destinationViewController setMovieToBeDetailed:self.selectedMovie];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.movies numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movies numberOfRowsForSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.movies titleForHeaderInSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieViewCell *movieCell = [self.tableView dequeueReusableCellWithIdentifier:@"movieCell"];
    movieCell.movieForCell = [self.movies objectAtIndex:indexPath];
    return movieCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedMovie = [self.movies objectAtIndex:indexPath];
    [self performSegueWithIdentifier:@"movieDetails" sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    // fill in later
}

- (void)reloadData {
    [self.tableView reloadData];
}

@end
