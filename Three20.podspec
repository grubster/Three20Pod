Pod::Spec.new do |s|
  s.name             = "Three20"
  s.version          = "1.0.11"
  s.summary          = "Three20 is an Objective-C library for iPhone developers."
  s.homepage         = "https://github.com/facebook/three20.git"
  s.license          = 'Apache License'
  s.author           = { "Pedro Souza" => "pedronicholas.souza@gmail.com" }
  s.source           = { :git => "https://github.com/facebook/three20.git", :tag => "1.0.11" }
  s.platform     = :ios
  s.requires_arc = false
  s.source_files = "Pod/Classes/Three20/{Source,Headers}/*.{h,m}"
  s.frameworks = 'UIKit'

  s.subspec 'Core' do |cs| 
    cs.source_files         = "Pod/Classes/Three20Core/{Sources,Headers}/**/*.{h,m}"
    cs.private_header_files = "Pod/Classes/Three20Core/Headers/TTExtensionInfoPrivate.h"
    cs.public_header_files  = "Pod/Classes/Three20Core/Headers"
    cs.header_dir           = "Three20Core"
  end

  s.subspec 'Network' do |nt| 
    nt.source_files         = "Pod/Classes/Three20Network/{Sources,Headers}/**/*.{h,m}"
    nt.private_header_files = "Pod/Classes/Three20Network/Headers/{TTRequestLoader,TTURLRequestQueueInternal}.h"
    nt.public_header_files  = "Pod/Classes/Three20Network/Headers"
    nt.header_dir           = 'Three20Network'
    nt.dependency  "Three20/Core"
  end

  s.subspec 'Style' do |st|
    st.source_files         = "Pod/Classes/Three20Style/{Sources,Headers}/**/*.{h,m}"
    st.private_header_files = "Pod/Classes/Three20Style/Headers/{TTShapeInternal,TTStyledNodeInternal,TTStyleInternal}.h"
    st.public_header_files  = "Pod/Classes/Three20Style/Headers"
    st.header_dir           = "Three20Style"
    st.dependency  "Three20/Core"
    st.dependency  "Three20/Network"
  end

  s.subspec 'UICommon' do |uic|
    uic.source_files          = "Pod/Classes/Three20UICommon/{Sources,Headers}/**/*.{h,m}"
    uic.private_header_files  = "Pod/Classes/Three20UICommon/Headers/UIViewControllerGarbageCollection.h"
    uic.public_header_files   = "Pod/Classes/Three20UICommon/Headers"
    uic.header_dir            = "Three20UICommon"
    uic.dependency            'Three20/Core'
    uic.dependency            'Three20/Network'
    uic.frameworks            = 'UIKit', 'CoreGraphics'
  end

  s.subspec 'UINavigator' do |uin|
    uin.source_files          = "Pod/Classes/Three20UINavigator/{Sources,Headers}/**/*.{h,m}"
    uin.private_header_files  = "Pod/Classes/Three20UINavigator/Headers/{TTBaseNavigatorInternal,TTURLArguments,TTURLArgumentType,TTURLLiteral,TTURLPatternInternal,TTURLPatternText,TTURLSelector,TTURLWildcard,UIViewController+TTNavigatorGarbageCollection}.h"
    uin.public_header_files   = "Pod/Classes/Three20UINavigator/Headers"
    uin.header_dir            = "Three20UINavigator"
    uin.dependency            "Three20/Core"
    uin.dependency            "Three20/UICommon"
  end

  s.subspec 'UI' do |ui|
      ui.source_files         = "Pod/Classes/Three20UI/{Sources,Headers}/**/*.{h,m}",
      ui.private_header_files = "Pod/Classes/Three20UI/Headers/{TTButtonContent,TTImageLayer,TTImageViewInternal,TTLauncherHighlightView,TTLauncherScrollView,TTNavigatorWindow,TTSearchTextFieldInternal,TTTabBarInternal,TTTextEditorInternal,TTTextView}.h",
      ui.public_header_files  = "Pod/Classes/Three20UI/Headers"
      ui.header_dir           = "Three20UI"
      ui.dependency           'Three20/Core'
      ui.dependency           'Three20/Network'
      ui.dependency           'Three20/Style'
      ui.dependency           'Three20/UICommon'
      ui.dependency           'Three20/UINavigator'
      ui.frameworks           = "QuartzCore"
  end

  s.subspec 'ext' do |ext|
    ext.subspec 'CSSStyle' do |css|
      css.source_files          = "Pod/Classes/extThree20CSSStyle/{Sources,Headers,ThirdPart}/*.{h,m}"
      css.private_header_files  = "Pod/Classes/extThree20CSSStyle/Headers/CssTokens.h"
      css.header_dir   = "Pod/Classes/extThree20CSSStyle/Headers"
      css.resources             = "Pod/Classes/extThree20CSSStyle/Resources/extThree20CSSStyle.bundle"   
      css.dependency 'Three20/Core'
      css.dependency 'Three20/Network'
      css.dependency 'Three20/Style'
    end

    ext.subspec 'JSON' do |json|
      json.source_files = "Pod/Classes/extThree20JSON/{Source,Headers}/**/*.{h,m}"
      json.header_dir = "extThree20JSON"
      json.header_mappings_dir = "Pod/Classes/extThree20JSON/Headers"
      json.dependency 'Three20/Core'
      json.dependency 'Three20/Network'
    end

    ext.subspec 'SBJSON' do |sb|
      sb.source_files = "Pod/Classes/extThree20JSON/Vendors/JSON/*.{h,m}",
      sb.header_dir = "extThree20JSON"
      sb.public_header_files = "Pod/Classes/extThree20JSON/Headers"
      sb.dependency 'Three20/Core'
      sb.dependency 'Three20/Network'
      sb.xcconfig = {"GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) EXTJSON_SBJSON"}
      sb.dependency 'Three20/ext/JSON'
    end

    ext.subspec 'YAJL' do |yj|
      yj.source_files = "Pod/Classes/extThree20JSON/Vendors/{**,*.h}/*.{h,m}"
      yj.private_header_files = "Pod/Classes/extThree20JSON/Vendors/YAJL/{**,*.h}/*.h"
      yj.header_dir   = "extThree20JSON"
      yj.xcconfig     = { "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) EXTJSON_YAJL" }
      yj.dependency   "Three20/ext/JSON"
    end

    ext.subspec 'XML' do |xml|
      xml.source_files = "Pod/Classes/extThree20XML/{Source,Headers}/*.{h,m}"
      xml.header_dir = "extThree20XML"
      xml.dependency 'Three20/Core'
      xml.dependency 'Three20/Network'
    end
  end
end

