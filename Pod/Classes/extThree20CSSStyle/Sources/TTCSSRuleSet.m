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

#import "extThree20CSSStyle/TTCSSRuleSet.h"
#import "extThree20CSSStyle/TTCSSFunctions.h"

// Style
#import "Three20Style/TTGlobalStyle.h"
#import "Three20Style/TTStyle.h"

// Core
#import "Three20Core/TTCorePreprocessorMacros.h"
#import "Three20Core/TTGlobalCore.h"
#import "Three20Core/TTDebug.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTCSSRuleSet
@synthesize selector, font_size, font_family, font_style, font_weight;
@synthesize color, background_color, background_image;
@synthesize text_shadow, text_shadow_opacity, text_align, text_decoration;
@synthesize width, height, visibility;
@synthesize top, left, right, bottom;
@synthesize vertical_align, margin_right, margin_left;

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Init Methods.

///////////////////////////////////////////////////////////////////////////////////////////////////
+(id)initWithSelectorName:(NSString*)anRuleSetName {
    TTCSSRuleSet *instance = [[TTCSSRuleSet new] autorelease];
    instance.selector = anRuleSetName;
    return instance;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(id)init {
    self = [super init];
    if (self != nil) {

        // Default values.
        self.background_color	  = [UIColor clearColor];
        self.color                = [UIColor clearColor];

		// Font size is the Default Sytem Font Size.
        self.font_size            = [NSNumber numberWithFloat:[UIFont systemFontSize]];

		// Default Font Family.
		self.font_family		  = [[UIFont systemFontOfSize:[UIFont systemFontSize]] familyName];
        self.font_style           = @"normal";

        // Default decoration.
        self.text_decoration = @"none";

		// Default alignment is left.
		self.text_align = @"left";

        // Default visiblity is visible.
        self.visibility = @"visible";

        // Default vertical aligment is top.
        self.vertical_align = @"top";
    }
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(void)dealloc {
    TT_RELEASE_SAFELY( font_family );
    TT_RELEASE_SAFELY( selector );
    TT_RELEASE_SAFELY( font_size );
    TT_RELEASE_SAFELY( font_weight );
    TT_RELEASE_SAFELY( font_style );
    TT_RELEASE_SAFELY( text_shadow );
    TT_RELEASE_SAFELY( color );
    TT_RELEASE_SAFELY( width );
    TT_RELEASE_SAFELY( height );
    TT_RELEASE_SAFELY( top );
    TT_RELEASE_SAFELY( left );
    TT_RELEASE_SAFELY( right );
    TT_RELEASE_SAFELY( bottom );
    TT_RELEASE_SAFELY( background_color );
    TT_RELEASE_SAFELY( background_image );
    TT_RELEASE_SAFELY( text_shadow_opacity );
    TT_RELEASE_SAFELY( text_decoration );
    TT_RELEASE_SAFELY( visibility );
    TT_RELEASE_SAFELY( vertical_align );
    TT_RELEASE_SAFELY( margin_right );
    TT_RELEASE_SAFELY( margin_left );
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSCopying Methods.
///////////////////////////////////////////////////////////////////////////////////////////////////
//Returns a new instance that’s a copy of the receiver. (required)
///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)copyWithZone:(NSZone *)zone {
    TTCSSRuleSet *copy = [[[self class] allocWithZone:zone] init];
    copy.font_family            = self.font_family;
    copy.selector               = self.selector;
    copy.font_size              = self.font_size;
    copy.font_weight            = self.font_weight;
    copy.font_style             = self.font_style;
    copy.text_shadow            = self.text_shadow;
    copy.color                  = self.color;
    copy.width                  = self.width;
    copy.height                 = self.height;
    copy.top                    = self.top;
    copy.left                   = self.left;
    copy.right                  = self.right;
    copy.bottom                 = self.bottom;
    copy.background_color       = self.background_color;
    copy.background_image       = self.background_image;
    copy.text_shadow_opacity    = self.text_shadow_opacity;
    copy.text_decoration        = self.text_decoration;
    copy.visibility             = self.visibility;
    copy.vertical_align         = self.vertical_align;
    copy.margin_right           = self.margin_right;
    copy.margin_left            = self.margin_left;
    return copy;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private Methods.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(NSError*)formatError:(NSString*)description {
	return [NSError errorWithDomain:NSStringFromClass([self class]) code:1
					userInfo:[NSDictionary dictionaryWithObject:description
														 forKey:NSLocalizedDescriptionKey]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Validate Methods.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)validateVertical_align:(id *)ioValue error:(NSError **)outError {
	// Validate correct values.
	if ( ![[NSArray arrayWithObjects:@"top", @"middle", @"bottom", nil]
		   containsObject:(NSString*)*ioValue] ) {
		*outError = [self formatError:@"'vertical_align' must be 'top', 'middle' or 'bottom'!"];
		return NO;
	}
	return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)validateText_decoration:(id *)ioValue error:(NSError **)outError {
	// Validate correct values.
	if ( ![[NSArray arrayWithObjects:@"none", @"underline", nil]
		   containsObject:(NSString*)*ioValue] ) {
		*outError = [self formatError:@"'text_decoration' must be 'underline' or 'none'!"];
		return NO;
	}
	return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)validateText_align:(id *)ioValue error:(NSError **)outError {
	// Validate correct values.
	if ( ![[NSArray arrayWithObjects:@"left", @"center", @"right", @"justify", nil]
		   containsObject:(NSString*)*ioValue] ) {
		*outError = [self formatError:@"'text_align' must be 'left', 'center', 'right' or 'justify'!"];
		return NO;
	}
	return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)validateVisibility:(id *)ioValue error:(NSError **)outError {
	// Validate correct values.
	if ( ![[NSArray arrayWithObjects:@"visible", @"hidden", nil]
		   containsObject:(NSString*)*ioValue] ) {
		*outError = [self formatError:@"'visibility' must be 'visible' or 'hidden'!"];
		return NO;
	}
	return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)validateFont_weight:(id *)ioValue error:(NSError **)outError {
	return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)validateFont_style:(id *)ioValue error:(NSError **)outError {
	// Validate correct values.
	if ( ![[NSArray arrayWithObjects:@"normal", @"italic", @"oblique", nil]
		   containsObject:(NSString*)*ioValue] ) {
		*outError = [self formatError:@"'font_style' must be 'normal', 'italic' or 'oblique'!"];
		return NO;
	}
	return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)validateFont_family:(id *)ioValue error:(NSError **)outError {

    NSString *source = (NSString*)*ioValue;
    // Source is nil, cut.
    if ( source == nil ) {
        NSString *error = @"Invalid value for font_family. Value is nil!";
        *outError = [self formatError:error];
        return NO;
    }

    //////////////////////////////////////////////////////////////////////
    // Strip posible ' or " strings from source.
    source = [source stringByTrimmingCharactersInSet:[NSCharacterSet
                                                      characterSetWithCharactersInString:@"\"'"]];

    NSString *fontFamily = nil;
    NSString *fontName   = nil;

    // Split Family and Name (if necessary).
    NSArray *splitted = [source componentsSeparatedByString:@"-"];
    fontFamily = [splitted objectAtIndex:0];
    fontName   = ( [splitted count] > 1 ? [splitted objectAtIndex:1] : nil );

    ////////// ///////// ///////// ///////// ///////// ///////// ///////// ///////// /////////
	// Validate..
    BOOL isFamilyAvailable, isNameAvailable;

    // Validate Family checking with Available System Fonts.
    NSArray *names = [UIFont familyNames];
    isFamilyAvailable = [names containsObject:fontFamily];

    ////////// ///////// ///////// ///////// ///////// ///////// ///////// ///////// /////////
    // Family isn't available, cut with error.
    if ( !isFamilyAvailable ) {
        NSString *error = [NSString stringWithFormat:@"iOS don't support the '%@' font family.",
                           fontFamily];
        *outError = [self formatError:error];
        return NO;
    }

    ////////// ///////// ///////// ///////// ///////// ///////// ///////// ///////// /////////
	// Family is available and don't have a Name to check, nothing else to do..
    if ( isFamilyAvailable && !fontFamily )
        return YES;

    ////////// ///////// ///////// ///////// ///////// ///////// ///////// ///////// /////////
	// Validate Family Name checking with Avaiable Name for System Fonts.
    NSArray *namesForFamily = [UIFont fontNamesForFamilyName:fontFamily];
    isNameAvailable = [namesForFamily containsObject:source];

	// Name is available and don't have a Name to check, nothing else to do..
    if ( isNameAvailable )
        return YES;

    // Name isn't available, cut with error.
    NSString *error =
    [NSString stringWithFormat:@"iOS don't support the Name '%@' for the '%@' family.",
                       fontName, fontFamily];
    *outError = [self formatError:error];
    return NO;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Validate colors.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)validateValue:(id *)ioValue forKey:(NSString *)inKey error:(NSError **)outError {
	// Colors validation.
	if ( [inKey isEqualToString:@"color"] || [inKey isEqualToString:@"background_color"] ) {

		// nil is Ok.
		if ( ioValue == nil )
			return YES;

		///////////////////////////////////
		// Validate correct types.
		if ( ( [*ioValue isKindOfClass:[NSArray class]] ||
			  [*ioValue isKindOfClass:[NSString class]] ||
			  [*ioValue isKindOfClass:[UIColor class]] )) {
			return YES;
		}

		///////////////////////////////////
		// Else Error.
		NSString *e;
		e = [NSString stringWithFormat:@"'%@' must be of class 'NSArray', 'NSString' or 'UIColor'",
						   inKey ];
		*outError = [self formatError:e];
		return NO;
	}

	// Other validations.
	return [super validateValue:ioValue forKey:inKey error:outError];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Set Methods.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(void)setUIColorProperty:(UIColor**)anColor withValue:(id)anValue {

	/////////////////////////////////
	// Release.
	if ( *anColor )
		TT_RELEASE_SAFELY( *anColor );

	///////////////////////////////////////
    // Array of color?
	if ( [anValue isKindOfClass:[NSArray class]] ) {

		// Set.
        *anColor = [TTColorFromCssValues(anValue) retain];

	}

    ///////////////////////////////////////
    // String color?
    else if ( [anValue isKindOfClass:[NSString class]] ) {

        // Set.
        *anColor = [TTColorFromCssValues([NSArray arrayWithObject:anValue]) retain];
    }

    ///////////////////////////////////////
    // UIColor?
    else if ( [anValue isKindOfClass:[UIColor class]] ) {

		// Set.
        *anColor = [anValue retain];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(void)setColor:(id)anColor {
	[self setUIColorProperty:&color withValue:anColor];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(void)setBackground_color:(id)anColor {
	[self setUIColorProperty:&background_color withValue:anColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Data Methods.
///////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
// Return an formatted UIFont object based on the defined properties.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(UIFont*)font {
    // If not enough properties return nil.
    if ( !font_family && !font_size ) {
        TTDWARNING ( @"Can't format UIFont, 'font_family' or 'font_size' isn't defined." );
        return nil;
    }

    //////////////////////////////////
    // Font weight.
    NSString *fullFontWeight = ( font_weight == nil
								? @""
								: [NSString stringWithFormat:@"-%@", [font_weight capitalizedString]] );

    //////////////////////////////////
    // Font Name.
    NSString *fullFontName = [NSString stringWithFormat:@"%@%@", [font_family capitalizedString],
							  fullFontWeight];

    //////////////////////////////////
    // Create and return UIFont.
    return [UIFont fontWithName:fullFontName size:[font_size floatValue]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Return an formatted UITextAlignment based on the defined <tt>'text_align'</tt> property.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(UITextAlignment)textAlign {
	if ([text_align isEqualToString:@"left"]) {
		return UITextAlignmentLeft;
	}
	else if ([text_align isEqualToString:@"center"]) {
		return UITextAlignmentCenter;
	}
	else if ([text_align isEqualToString:@"right"]) {
		return UITextAlignmentRight;
	}
	return UITextAlignmentLeft;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Return an formatted CGSize based on the defined width and height properties.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(CGSize)size {
    return CGSizeMake(TTValueFromCssValues(self.width), TTValueFromCssValues(self.height));
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Return an formatted CGPoint based on the defined top and left properties.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(CGPoint)origin {
    return CGPointMake(TTValueFromCssValues(self.left), TTValueFromCssValues(self.top));
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Return an Boolean value that determines whether the receiver is hidden
///////////////////////////////////////////////////////////////////////////////////////////////////
-(BOOL)hidden {
    return [self.visibility isEqualToString:@"hidden"];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// Return an formatted UIViewContentMode based on the defined
// <tt>'margin-left'</tt>, <tt>'margin-right'</tt> and <tt>'vertical_align'</tt> properties.
// If isn't setted return default left-top alignment.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(UIViewContentMode)contentModeAlignment {
    UIViewContentMode mode;
    if ([vertical_align isEqualToString:@"top"]) {
		mode |= UIViewContentModeTop;
	}
	else if ([vertical_align isEqualToString:@"middle"]) {
		mode |= UIViewContentModeCenter;
	}
	else if ([vertical_align isEqualToString:@"bottom"]) {
		mode |= UIViewContentModeBottom;
	}
    /////////
    if ([margin_right isEqualToString:@"auto"] && ![margin_left isEqualToString:@"auto"]) {
		mode |= UIViewContentModeLeft;
	}
	else if ([margin_right isEqualToString:@"auto"] && [margin_left isEqualToString:@"auto"]) {
		mode |= UIViewContentModeCenter;
	}
	else if (![margin_right isEqualToString:@"auto"] && [margin_left isEqualToString:@"auto"]) {
		mode |= UIViewContentModeRight;
	}
    return mode;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
// Return an formatted UIControlContentVerticalAlignment based on the defined
// <tt>'vertical_align'</tt> property. If isn't setted return default top alignment.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(UIControlContentVerticalAlignment)contentVerticalAlignment {
	if ([vertical_align isEqualToString:@"top"]) {
		return UIControlContentVerticalAlignmentTop;
	}
	else if ([vertical_align isEqualToString:@"middle"]) {
		return UIControlContentVerticalAlignmentCenter;
	}
	else if ([vertical_align isEqualToString:@"bottom"]) {
		return UIControlContentVerticalAlignmentBottom;
	}
	return UIControlContentVerticalAlignmentTop;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Return an formatted UIControlContentHorizontalAlignment based on the defined
// <tt>'margin-left'</tt> and <tt>margin-right</tt> properties.
///////////////////////////////////////////////////////////////////////////////////////////////////
-(UIControlContentHorizontalAlignment)contentHorizontalAlignment {
	if ([margin_right isEqualToString:@"auto"] && ![margin_left isEqualToString:@"auto"]) {
		return UIControlContentHorizontalAlignmentLeft;
	}
	else if ([margin_right isEqualToString:@"auto"] && [margin_left isEqualToString:@"auto"]) {
		return UIControlContentHorizontalAlignmentCenter;
	}
	else if (![margin_right isEqualToString:@"auto"] && [margin_left isEqualToString:@"auto"]) {
		return UIControlContentHorizontalAlignmentRight;
	}
    return UIControlContentHorizontalAlignmentLeft;
}

@end
