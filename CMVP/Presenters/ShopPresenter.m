//
//  ShopPresenter.m
//  CMVP
//
//  Created by ThawDeZin on 29/02/2024.
//

#import <Foundation/Foundation.h>
#import "ShopPresenter.h"

@implementation ShopPresenter

- (void)fetchShopData {
    // Define the API endpoint URL
    NSString *apiURL = @"https://israfilapi.vercel.app/retrieveAllShop";
    
    // Create a URL object from the API URL string
    NSURL *url = [NSURL URLWithString:apiURL];
    
    // Create a URL session configuration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Create a URL session with the configuration
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    // Create a data task with the URL session for making a GET request
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // Check if there's an error
        if (error) {
            // Notify delegate of failure with error
            [self.delegate shopDataFetchingFailedWithError:error];
            return;
        }
        
        // Check if response is valid JSON
        NSError *jsonError;
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            // Notify delegate of failure with error
            [self.delegate shopDataFetchingFailedWithError:jsonError];
            return;
        }
        
        // Parse JSON response
        NSArray *shopsJSON = responseObject[@"shops"];
        NSMutableArray *shops = [NSMutableArray array];
        for (NSDictionary *shopDict in shopsJSON) {
            Shop *shop = [[Shop alloc] init];
            // Populate Shop model properties from dictionary
            shop.address = shopDict[@"address"];
            shop.cluster = shopDict[@"cluster"];
            // Parse and set other properties similarly
            // ...
            [shops addObject:shop];
        }
        
        // Notify delegate of successful data fetch
        [self.delegate shopDataFetchedSuccessfully:shops];
    }];
    
    // Resume the data task to start the request
    [dataTask resume];
}

@end

