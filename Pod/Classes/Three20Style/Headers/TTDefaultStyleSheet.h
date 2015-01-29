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
#import "Three20Style/TTStyleSheet.h"

@class TTShape;

@interface TTDefaultStyleSheet : TTStyleSheet

// Common styles
@property (unsafe_unretained, nonatomic, readonly) UIColor*  textColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  highlightedTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIFont*   font;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  backgroundColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  navigationBarTintColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  toolbarTintColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  searchBarTintColor;

// Tables
@property (unsafe_unretained, nonatomic, readonly) UIColor*  tablePlainBackgroundColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  tableGroupedBackgroundColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  searchTableBackgroundColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  searchTableSeparatorColor;

// Table Headers
@property (unsafe_unretained, nonatomic, readonly) UIColor*  tableHeaderTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  tableHeaderShadowColor;
@property (nonatomic, readonly) CGSize    tableHeaderShadowOffset;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  tableHeaderTintColor;

// Photo Captions
@property (unsafe_unretained, nonatomic, readonly) UIColor*  photoCaptionTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  photoCaptionTextShadowColor;
@property (nonatomic, readonly) CGSize    photoCaptionTextShadowOffset;

@property (unsafe_unretained, nonatomic, readonly) UIColor*  timestampTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  linkTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor*  moreLinkTextColor;

@property (unsafe_unretained, nonatomic, readonly) UIColor* screenBackgroundColor;

@property (unsafe_unretained, nonatomic, readonly) UIColor* tableActivityTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor* tableErrorTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor* tableSubTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor* tableTitleTextColor;

@property (unsafe_unretained, nonatomic, readonly) UIColor* tabTintColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor* tabBarTintColor;

@property (unsafe_unretained, nonatomic, readonly) UIColor* messageFieldTextColor;
@property (unsafe_unretained, nonatomic, readonly) UIColor* messageFieldSeparatorColor;

@property (unsafe_unretained, nonatomic, readonly) UIColor* thumbnailBackgroundColor;

@property (unsafe_unretained, nonatomic, readonly) UIColor* postButtonColor;

@property (unsafe_unretained, nonatomic, readonly) UIFont* buttonFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* tableFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* tableSmallFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* tableTitleFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* tableTimestampFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* tableButtonFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* tableSummaryFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* tableHeaderPlainFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* tableHeaderGroupedFont;
@property (nonatomic, readonly) CGFloat tableBannerViewHeight;
@property (unsafe_unretained, nonatomic, readonly) UIFont* photoCaptionFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* messageFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* errorTitleFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* errorSubtitleFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* activityLabelFont;
@property (unsafe_unretained, nonatomic, readonly) UIFont* activityBannerFont;

@property (nonatomic, readonly) UITableViewCellSelectionStyle tableSelectionStyle;

- (TTStyle*)selectionFillStyle:(TTStyle*)next;

- (TTStyle*)toolbarButtonForState:(UIControlState)state shape:(TTShape*)shape
            tintColor:(UIColor*)tintColor font:(UIFont*)font;

- (TTStyle*)pageDotWithColor:(UIColor*)color;

@end
