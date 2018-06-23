//
//  CBStudents.m
//  CBMultithreadHomework
//
//  Created by Alina on 29.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBStudents.h"

@implementation CBStudents

+(dispatch_queue_t) createQueue {
    
};




-(void) guessNumber:(NSInteger*) number  guessRange: (NSMutableArray*) range {
    
    dispatch_queue_t queute = dispatch_queue_create("com.cbpanamarou.multithread.queue",DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queute, ^{
        
        double startTime = CFAbsoluteTimeGetCurrent();
    
        NSNumber* maxValue = [range valueForKeyPath:@"@max.self"];
        NSNumber* minValue = [range valueForKeyPath:@"@min.self"];
        
        int minValueInteger = [minValue integerValue];
        int maxValueInteger = [maxValue integerValue];
        
        int randomNumber  =  minValueInteger + arc4random()%(maxValueInteger-minValueInteger + 1 );
        
        while (randomNumber != number) {
            randomNumber = minValueInteger + arc4random()%(maxValueInteger-minValueInteger + 1 );
        }
        
        double finishTime  = CFAbsoluteTimeGetCurrent() - startTime;
        
        NSLog(@"%@ finished at %f time ", _name,finishTime);

    });
}
          //             LEVEL STUDENT

-(void) guessNumberSt:(NSInteger*) number  guessRangeSt: (NSMutableArray*) range getBlockSt:(void(^)(void)) block{
    dispatch_queue_t queute = dispatch_queue_create("com.cbpanamarou.multithread.queue",DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queute, ^{
        
        double startTime = CFAbsoluteTimeGetCurrent();
        
        NSNumber* maxValue = [range valueForKeyPath:@"@max.self"];
        NSNumber* minValue = [range valueForKeyPath:@"@min.self"];
        
        int minValueInteger = [minValue integerValue];
        int maxValueInteger = [maxValue integerValue];
        
        int randomNumber  =  minValueInteger + arc4random()%(maxValueInteger-minValueInteger + 1 );
        
        while (randomNumber != number) {
            randomNumber = minValueInteger + arc4random()%(maxValueInteger-minValueInteger + 1 );
        }
        
        _finishTime  = CFAbsoluteTimeGetCurrent() - startTime;
        
        block();
        
        
    });
}



@end
