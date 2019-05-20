//
//  ViewController.m
//  table-view-study
//
//  Created by daniel.kwon on 18/03/2019.
//  Copyright © 2019 Nexstreaming VIS. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController()

@property (strong, nonatomic) UITableViewCell *firstNameCell;
@property (strong, nonatomic) UITableViewCell *lastNameCell;
@property (strong, nonatomic) UITableViewCell *shareCell;
@property (strong, nonatomic) UITableViewCell *imageCell;
@property (strong, nonatomic) UITableViewCell *detailCell;

@property (strong, nonatomic) UITextField *firstNameText;
@property (strong, nonatomic) UITextField *lastNameText;

@property (strong, nonatomic) UITableViewCell *heroCell;
@property (strong, nonatomic) NSArray *heroNames;
@property (strong, nonatomic) NSArray *heroImages;

@end

@implementation TableViewController


- (void)loadView
{
    [super loadView];
    
    // set the title
    self.title = @"Table View Study";
    
    // construct first name cell, section 0, row 0
    self.firstNameCell = [[UITableViewCell alloc] init];
    self.firstNameCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    self.firstNameText = [[UITextField alloc]initWithFrame:CGRectInset(self.firstNameCell.contentView.bounds, 15, 0)];
    self.firstNameText.placeholder = @"First Name";
    [self.firstNameCell addSubview:self.firstNameText];
    
    // construct last name cell, section 0, row 1
    self.lastNameCell = [[UITableViewCell alloc] init];
    self.lastNameCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    self.lastNameText = [[UITextField alloc]initWithFrame:CGRectInset(self.lastNameCell.contentView.bounds, 15, 0)];
    self.lastNameText.placeholder = @"Last Name";
    [self.lastNameCell addSubview:self.lastNameText];
    
    // construct share cell, section 1, row 00
    self.shareCell = [[UITableViewCell alloc]init];
    self.shareCell.textLabel.text = @"Share with Friends";
    self.shareCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    self.shareCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    // construct imageCell, section 1, row 01
    self.imageCell = [[UITableViewCell alloc] init];
    self.imageCell.backgroundColor = UIColor.blackColor;
    
    // construct detailCell, section 2, row 02
    self.detailCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailCell"];
    
    self.heroNames = [NSArray arrayWithObjects:@"CaptainAmerica", @"DoctorStrange", @"Hulk", @"IronMan", @"Spiderman", nil];
    self.heroImages = [NSArray arrayWithObjects:@"captainAmerica", @"doctorStrange", @"hulk", @"ironMan", @"spiderman", nil];
}

#pragma Table View Data Source

// Return the number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

// Return the number of rows for each section in your static table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:  return 2;  // section 0 has 2 rows
        case 1:  return 3;  // section 1 has 3 rows
        case 2: return [self.heroNames count];
        default: return 0;
    };
}

// Return the row for the corresponding section and row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.section)
    {
        case 0:
            switch(indexPath.row)
        {
            case 0: return self.firstNameCell;  // section 0, row 0 is the first name
            case 1: return self.lastNameCell;   // section 0, row 1 is the last name
        }
        case 1:
            switch(indexPath.row)
        {
            case 0: return self.shareCell;      // section 1, row 0 is the share option
            case 1:                             // section 1, row 1 is the imageCell
            {
                // Load imageData from given URL
                NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://d1nuw15ac20b2a.cloudfront.net/wp-content/uploads/2019/02/19152908/logo-nexplayer-480.png"]];
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                
                // add imageView to self.imageCell
                [self.imageCell addSubview:imageView];
                
                // Implement Auto layout
                imageView.translatesAutoresizingMaskIntoConstraints = false;
                [imageView.widthAnchor constraintEqualToAnchor:self.imageCell.widthAnchor].active = true;
                [imageView.heightAnchor constraintEqualToAnchor:self.imageCell.heightAnchor].active = true;
                
                return self.imageCell;
            }
            case 2:
            {
                UILabel *countryLabel, *codeLabel, *continentLabel, *populationLabel;
                UIButton *detailInfoButton;
                
                //create custom labels and button inside the cell view
                CGRect detailCellFrame = CGRectMake(15.0, 0.0, 220, 25.0);
                countryLabel = [[UILabel alloc] initWithFrame:detailCellFrame];
                countryLabel.tag = 1;
                [self.detailCell.contentView addSubview:countryLabel];
                
                detailInfoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                detailInfoButton.frame = CGRectMake(self.detailCell.contentView.bounds.size.width, 0.0, 90, 25.0);
                [detailInfoButton setTitle:@"Detail Info"
                                  forState:UIControlStateNormal];
                [detailInfoButton addTarget:self
                                     action:@selector(detailInfo:)
                           forControlEvents:UIControlEventTouchUpInside];
                [self.detailCell.contentView addSubview:detailInfoButton];
                
                detailCellFrame.origin.y += 25;
                codeLabel = [[UILabel alloc] initWithFrame:detailCellFrame];
                codeLabel.tag = 2;
                [self.detailCell.contentView addSubview:codeLabel];
                
                detailCellFrame.origin.y += 25;
                continentLabel = [[UILabel alloc] initWithFrame:detailCellFrame];
                continentLabel.tag = 3;
                [self.detailCell.contentView addSubview:continentLabel];
                
                detailCellFrame.origin.y += 25;
                populationLabel = [[UILabel alloc] initWithFrame:detailCellFrame];
                populationLabel.tag = 4;
                [self.detailCell.contentView addSubview:populationLabel];
                
                countryLabel.text = @"Name: Korea Rep.";
                codeLabel.text = @"Code: KOR";
                continentLabel.text = @"Continent: Asia";
                populationLabel.text = @"Population: 51313024";
                
                return self.detailCell;
            }
        }
        case 2:
        {
			self.heroCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"heroCell"];
			
			UIImage *heroImage = [UIImage imageNamed:self.heroImages[indexPath.row]];
			UIImageView *heroImageView = [[UIImageView alloc] initWithImage:heroImage];
			[self.heroCell addSubview:heroImageView];
			heroImageView.translatesAutoresizingMaskIntoConstraints = false;
			
			[heroImageView.centerYAnchor constraintEqualToAnchor:self.heroCell.centerYAnchor].active = true;
			[heroImageView.topAnchor constraintEqualToAnchor:self.heroCell.topAnchor constant:-7].active = true;
			[heroImageView.widthAnchor constraintEqualToConstant:113].active = true;
			[heroImageView.heightAnchor constraintEqualToConstant:94].active = true;
			[heroImageView.bottomAnchor constraintEqualToAnchor:self.heroCell.bottomAnchor].active = true;
			[heroImageView.leadingAnchor constraintEqualToAnchor:self.heroCell.leadingAnchor constant:10].active = true;
			
			UILabel *heroLabel = [[UILabel alloc] init];
			heroLabel.text = self.heroNames[indexPath.row];
			[self.heroCell addSubview:heroLabel];
			
			heroLabel.translatesAutoresizingMaskIntoConstraints = false;
			[heroLabel.leadingAnchor constraintEqualToAnchor:heroImageView.trailingAnchor constant:17].active = true;
			[heroLabel.centerYAnchor constraintEqualToAnchor:heroImageView.centerYAnchor].active = true;
			
			return self.heroCell;
        }
    }
    return nil;
}

- (void) detailInfo:(UIButton *)sender {
    NSLog(@"Action of detailInfo");
}

#pragma Table View Delegate

// Customize the section headings for each section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section)
    {
        case 0: return @"Profile";
        case 1: return @"Social";
        case 2: return @"MCU Heroes";
    }
    return nil;
}

- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSLog(@"swipe to delete");
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    } else if(editingStyle == UITableViewCellEditingStyleInsert){
        
    } else {
        NSLog(@"Unhandled editing style ! %d", editingStyle);
    }
}


// Configure the row selection code for any cells that you want to customize the row selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Handle social cell selection to toggle checkmark
    if(indexPath.section == 1 && indexPath.row == 0) {
        
        // deselect row
        [tableView deselectRowAtIndexPath:indexPath animated:false];
        
        // toggle check mark
        if(self.shareCell.accessoryType == UITableViewCellAccessoryNone)
            self.shareCell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            self.shareCell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat result = UITableViewAutomaticDimension;
    if ([tableView isEqual:self.tableView] && indexPath.section == 1 && indexPath.row == 2){
        result = 100.0f;
    }
    return result;
}
@end
