//
//  AcronymsTableViewCell.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <UIKit/UIKit.h>
//Custom cell to display Acronym. It just display the Acronym, Frequesnt and Year
@interface AcronymsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblAcronym;
@property (weak, nonatomic) IBOutlet UILabel *lblFrequency;
@property (weak, nonatomic) IBOutlet UILabel *lblYear;

@end
