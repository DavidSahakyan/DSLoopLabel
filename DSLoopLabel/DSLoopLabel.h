////////////////////////////////////////////////////////////////////////////////////
//                          DSLoopLabel.h                                         //
////////////////////////////////////////////////////////////////////////////////////

/*
 # Copyright (c) 2013 David Sahakyan
 #
 # Permission is hereby granted, free of charge, to any person obtaining a copy
 # of this software and associated documentation files (the "Software"), to deal
 # in the Software without restriction, including without limitation the rights
 # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 # copies of the Software, and to permit persons to whom the Software is
 # furnished to do so, subject to the following conditions:
 #
 # The above copyright notice and this permission notice shall be included in
 # all copies or substantial portions of the Software.
 #
 # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 # THE SOFTWARE.
 #
*/

//--------------------------------------- Description -----------------------------------------------//
// This mini lib gives you a simple label.
// When you set the property score, Label will animate looping for you.
//---------------------------------------------------------------------------------------------------//

//------------------------------------ Mini Using Guide ---------------------------------------------//
// 1. Create Label ->
//
//      DSLoopLabel *loopLabel = [DSLoopLabel standartLoopLabelWithFont:font
//                                                                Frame:CGRectMake(x, y, width, heigth)
//                                                             AndColor:[UIColor whiteColor]
//                                                          andDelegate:self ];
//
// 2. Subview loopLabel to your view -> [self.view addSubView:loopLabel];
//
// 3. And use It -> loopLabel.score = 400;
//
// 4. You will get Callbacks
//      - (void)loopingDidStarted;
//      - (void)loopingDidEnded;
//    on start and end of looping

// -- OR ---
// 1.  You can simply use the label from storyboard,
//     by changing the standart Class of UILabel to DSLoopLabel
//
// 2. Make Outlet of the DSLoopLabel into your ViewController
//
// 3. And use It -> loopLabel.score = 400;
//
// 4. You will get Callbacks
//      - (void)loopingDidStarted;
//      - (void)loopingDidEnded;
//    on start and end of looping

//--------------------------------------------------------------------------------------------------//

#import <UIKit/UIKit.h>

@protocol DSLoopLabelDelegate <NSObject>

@optional

- (void)loopingDidStarted;
- (void)loopingDidEnded;

@end

@interface DSLoopLabel : UILabel

@property (weak, nonatomic) id<DSLoopLabelDelegate> delegate;
@property (nonatomic) NSInteger score;

+ (DSLoopLabel*)standartLoopLabelWithFont:(UIFont*)font
                                    Frame:(CGRect)frame
                                 AndColor:(UIColor*)color
                              andDelegate:(id<DSLoopLabelDelegate>)delegate;

@end
