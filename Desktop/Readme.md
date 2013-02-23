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