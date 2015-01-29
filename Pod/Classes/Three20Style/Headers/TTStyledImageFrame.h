//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

// Style
#import "Three20Style/TTStyledFrame.h"
#import "Three20Style/TTStyleDelegate.h"

@class TTStyledImageNode;

@interface TTStyledImageFrame : TTStyledFrame <TTStyleDelegate> {
  TTStyledImageNode*  __unsafe_unretained _imageNode;
  TTStyle*            _style;
}

/**
 * The node represented by the frame.
 */
@property (unsafe_unretained, nonatomic, readonly) TTStyledImageNode* imageNode;

/**
 * The style used to render the frame;
 */
@property (nonatomic, strong) TTStyle* style;

- (id)initWithElement:(TTStyledElement*)element node:(TTStyledImageNode*)node;

@end
