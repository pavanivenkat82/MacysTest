//
//  AcronymsViewController.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsViewController.h"
#import "AcronymsNetworkManager.h"
#import "AcronymsTableViewCell.h"
#import "MBProgressHUD.h"

@interface AcronymsViewController ()<AcronymsNetworkManagerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnGo;
@property (weak, nonatomic) IBOutlet UITextField *txtSearchTerm;
@property (nonatomic) AcronymsDataList* dataList;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation AcronymsViewController

#pragma mark - ViewController Life Cyscle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Disabling GO button by default
    self.btnGo.backgroundColor = [UIColor lightGrayColor];
    [[self.btnGo layer] setBorderWidth:1.0f];
    [[self.btnGo layer] setBorderColor:[UIColor redColor].CGColor];
    self.btnGo.layer.cornerRadius = 5;
    self.btnGo.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Actions
//Go Button action
- (IBAction)searchAcronym:(id)sender
{
    [self.txtSearchTerm resignFirstResponder];
    NSString* searchTerm = self.txtSearchTerm.text;
    [self makeSearchNetworkCall:searchTerm];
}

//Checking whether user entered atleast 2 letters
- (IBAction)editingChanged:(id)sender
{
    NSString* inputData = self.txtSearchTerm.text;
    //If it is valid number enable button and change the back ground color
    if(inputData && inputData.length > 1)
    {
        //Enable button
        self.btnGo.enabled = YES;
        self.btnGo.backgroundColor = [UIColor darkGrayColor];
        [[self.btnGo layer] setBorderWidth:1.0f];
        [[self.btnGo layer] setBorderColor:[UIColor greenColor].CGColor];
    }
    else
    {
        //Disable button
        self.btnGo.enabled = NO;
        self.btnGo.backgroundColor = [UIColor lightGrayColor];
        [[self.btnGo layer] setBorderWidth:1.0f];
        [[self.btnGo layer] setBorderColor:[UIColor redColor].CGColor];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *) textField
{
    [self.txtSearchTerm resignFirstResponder];
    NSString* searchTerm = self.txtSearchTerm.text;
    if(searchTerm.length < 2)
        return YES;
    
    [self makeSearchNetworkCall:searchTerm];
    
    return NO;
}

#pragma mark - Network Methods

// making network call
-(void) makeSearchNetworkCall :(NSString*) searchTerm
{
    //Showing ActivityIndicator status bar
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    //Showing MBProgressHUD progress
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //Cretaing inputparameters
    NSMutableDictionary* inputParams = [NSMutableDictionary dictionary];
    [inputParams setValue:searchTerm	forKey:kJSONSearchTerm];
    //Creating request data
    AcronymsRequestData* reqData = [[AcronymsRequestData alloc] initWithURL:kNetworkURLGetAcronyms networkRequestType:AcronymsNetworkRequestTypeGET serviceType:AcronymsServiceTypeGetAcronyms inputPrameters:inputParams] ;
    
    AcronymsNetworkManager* manager = [[AcronymsNetworkManager alloc] init];
    manager.networkResponseDelegate = self;
    [manager sendAsynchronousRequest:reqData];
}


-(void) sendResponseData:(AcronymsResponseData*) responseData
{
    //Hiding ActivityIndicator status bar
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    //Hiding MBProgressHUD progress
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if(responseData.serviceType == AcronymsServiceTypeGetAcronyms)
    {
        AcronymsMobileData* data = responseData.mobileData;
        if(data.error)
        {
            //Displaying alert view
            _dataList = [[AcronymsDataList alloc] init];
            [self.tableView reloadData];
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No results" message:@"No results found. Please try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            //setting data and relading table view
            AcronymsDataList* list = (AcronymsDataList*)responseData.mobileData;
            _dataList = list;
            [self.tableView reloadData];
            if (!list || !list.arrResults || list.arrResults.count == 0)
            {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No results" message:@"No results found. Please try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            
        }
    }
}

#pragma mark - Tableview Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_dataList)
        return _dataList.arrResults.count;
    
    return 0;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Get the tableview cell
    AcronymsTableViewCell* acronymCell = [tableView dequeueReusableCellWithIdentifier:@"ACRONYMCELL" forIndexPath:indexPath];
    //Get dat based upon index
    AcronymsData* acronymData = self.dataList.arrResults[indexPath.row];
    //set data to the table view cell
    acronymCell.lblAcronym.text = acronymData.abrevaition;
    acronymCell.lblFrequency.text = [NSString stringWithFormat:@"Frequency : %lu",acronymData.frequecy];
    acronymCell.lblYear.text = [NSString stringWithFormat:@"Since : %lu",acronymData.year];
    
    
    return acronymCell;
}





@end
