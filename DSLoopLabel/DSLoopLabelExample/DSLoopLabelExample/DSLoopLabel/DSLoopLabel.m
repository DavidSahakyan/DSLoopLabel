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

#import "DSLoopLabel.h"

#import <AudioToolbox/AudioToolbox.h>

@interface DSLoopLabel()

@property (nonatomic) NSInteger loop;

@end

@implementation DSLoopLabel

//--------------------------------------------------------------------------------------//
#pragma mark - Actions
//--------------------------------------------------------------------------------------//
- (void)setScore:(NSInteger)score
{
    
    if (score && (score - self.score)) {
        [self playSound:self.soundForLooping];
        //---------------------- Informing Delegate about state --------------------------------//
        if(self.delegate && [self.delegate respondsToSelector:@selector(loopingDidStarted)]) {
            [self.delegate loopingDidStarted];
        }
        //--------------------------------------------------------------------------------------//
        //---------------------------------- Control Unit --------------------------------------//
        self.loop = 0;
        if (score > 99 ){
            [NSTimer scheduledTimerWithTimeInterval:self.looperTime/100.0
                                             target:self
                                           selector:@selector(scoreLoopEffect:)
                                           userInfo:nil
                                            repeats:YES];
        } else {
            [NSTimer scheduledTimerWithTimeInterval:self.looperTime/(float)score
                                             target:self
                                           selector:@selector(scoreLoopEffectLess:)
                                           userInfo:nil
                                            repeats:YES];
        }
        //--------------------------------------------------------------------------------------//
    } else {
        self.text = [NSString stringWithFormat:@"%i",score];
    }
    _score = score;
}

//--------------------------------------------------------------------------------------//
#pragma mark - Helpers
//--------------------------------------------------------------------------------------//

- (void)scoreLoopEffect:(NSTimer*)timer
{
    if (self.loop < self.score) {
        NSInteger step = self.score / 99;
        self.loop += step;
        self.text = [NSString stringWithFormat:@"%i", self.loop];
    } else {
        [timer invalidate];
        self.text = [NSString stringWithFormat:@"%i", self.score];
        //---------------------- Informing Delegate about state --------------------------------//
        if(self.delegate && [self.delegate respondsToSelector:@selector(loopingDidEnded)]) {
            [self.delegate loopingDidEnded];
        }
        //--------------------------------------------------------------------------------------//        
    }
}

- (void)scoreLoopEffectLess:(NSTimer*)timer
{
    if ( self.loop < self.score) {
        int step = 1;
        self.loop += step;
        self.text = [NSString stringWithFormat:@"%i", self.loop];
    } else {
        [timer invalidate];
        self.text = [NSString stringWithFormat:@"%i", self.score];
        //---------------------- Informing Delegate about state --------------------------------//
        if(self.delegate && [self.delegate respondsToSelector:@selector(loopingDidEnded)]) {
            [self.delegate loopingDidEnded];
        }
        //--------------------------------------------------------------------------------------//
    }
}


- (void)playSound:(NSString *)file
{
    if (file) {
        NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
        NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
        AudioServicesPlaySystemSound(soundID);
    }
}

//--------------------------------------------------------------------------------------//
#pragma mark - LifeCycle

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.looperTime = 2.0;
}
//--------------------------------------------------------------------------------------//

//--------------------------------------------------------------------------------------//
#pragma mark - Builder
//--------------------------------------------------------------------------------------//
+ (DSLoopLabel*)standartLoopLabelWithFont:(UIFont*)font
                                    Frame:(CGRect)frame
                                 AndColor:(UIColor*)color
                              andDelegate:(id<DSLoopLabelDelegate>)delegate
{
    DSLoopLabel *loopLabel = [[DSLoopLabel alloc] initWithFrame:frame];

    loopLabel.textColor = color;
    loopLabel.font = font;
    loopLabel.backgroundColor = [UIColor clearColor];
    loopLabel.adjustsFontSizeToFitWidth = YES;
    loopLabel.textAlignment = NSTextAlignmentCenter;
    
    return loopLabel;
}

@end
