//
//  MCUHeroCell.h
//  table-view-study
//
//  Created by HanGyo Jeong on 13/05/2019.
//  Copyright © 2019 Nexstreaming VIS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCUHeroCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *MCUHeroProfile;
@property (weak, nonatomic) IBOutlet UILabel *MCUHeroName;

@end

NS_ASSUME_NONNULL_END
