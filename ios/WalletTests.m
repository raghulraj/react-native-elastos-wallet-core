
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "React/RCTLog.h"
#import <RCTTest/RCTTestRunner.h>
#import "RCTAssert.h"

#define RCT_TEST(name)                  \
- (void)test##name                      \
{                                       \
[_runner runTest:_cmd module:@#name]; \
}

@interface IntegrationTests : XCTestCase

@end

@implementation IntegrationTests
{
  RCTTestRunner *_runner;
  RCTBridge *_bridge;
  dispatch_semaphore_t _logSem;
}

- (void)setUp
{
  _runner = RCTInitRunnerForApp(@"tests/IntegrationTestsApp", nil, nil);
}

-(void)tearDown
{
  [_bridge invalidate];
  _bridge = nil;
  
  //RCTSetLogFunction(RCTDefaultLogFunction);
}

-(void)testElaWallet
{
  [_runner runTest:_cmd
            module:@"Tests"
      initialProps:@{@"TestName": @"testElaWallet"}
configurationBlock:nil];
  RCTLogInfo(@"Executing the tests.");

}

#pragma mark Logic Tests

//RCT_TEST(Tests)

@end


