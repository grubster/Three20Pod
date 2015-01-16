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
  s.default_subspec = "UI"
  s.source_files = "Pod/Classes/Three20/{Source,Headers}/*.{h,m}"
  s.frameworks = 'UIKit'
  s.preserve_paths = 'Pod/Classes/Three20/libThree20.a'
  s.ios.vendored_library = 'Pod/Classes/Three20/libThree20.a'
  s.libraries = 'Three20'

  s.subspec 'Core' do |cs| 
    cs.source_files         = "Pod/Classes/Three20Core/{Sources,Headers}/**/*.{h,m}"
    cs.private_header_files = "Pod/Classes/Three20Core/Headers/TTExtensionInfoPrivate.h"
    cs.public_header_files  = "Pod/Classes/Three20Core/Headers"
    cs.header_dir           = "Three20Core"
    cs.preserve_paths       = 'Pod/Classes/Three20Core/libThree20Core.a'
    cs.ios.vendored_library = 'Pod/Classes/Three20Core/libThree20Core.a'
    cs.libraries = 'Three20Core'
  end

  s.subspec 'Network' do |nt| 
    nt.source_files         = "Pod/Classes/Three20Network/{Sources,Headers}/**/*.{h,m}"
    nt.private_header_files = "Pod/Classes/Three20Network/Headers/{TTRequestLoader,TTURLRequestQueueInternal}.h"
    nt.public_header_files  = "Pod/Classes/Three20Network/Headers"
    nt.header_dir           = 'Three20Network'
    nt.dependency           "Three20/Core"
    # nt.preserve_paths       = 'Pod/Classes/Three20Network/libThree20Network.a'
    # nt.ios.vendored_library = 'Pod/Classes/Three20Network/libThree20Network.a'
    # nt.libraries = 'Three20Network'
  end

  s.subspec 'Style' do |st|
    st.source_files         = "Pod/Classes/Three20Style/{Sources,Headers}/**/*.{h,m}"
    st.private_header_files = "Pod/Classes/Three20Style/Headers/{TTShapeInternal,TTStyledNodeInternal,TTStyleInternal}.h"
    st.public_header_files  = "Pod/Classes/Three20Style/Headers"
    st.header_dir           = "Three20Style"
    st.dependency           "Three20/Core"
    st.dependency           "Three20/Network"
    st.preserve_paths       = 'Pod/Classes/Three20Style/libThree20Style.a'
    st.ios.vendored_library = 'Pod/Classes/Three20Style/libThree20Style.a'
    st.libraries = 'Three20Style'
  end

  s.subspec 'UICommon' do |uic|
    uic.source_files          = "Pod/Classes/Three20UICommon/{Sources,Headers}/**/*.{h,m}"
    uic.private_header_files  = "Pod/Classes/Three20UICommon/Headers/UIViewControllerGarbageCollection.h"
    uic.public_header_files   = "Pod/Classes/Three20UICommon/Headers"
    uic.header_dir            = "Three20UICommon"
    uic.dependency            'Three20/Core'
    uic.dependency            'Three20/Network'
    uic.frameworks            = 'UIKit', 'CoreGraphics'
    uic.preserve_paths        = 'Pod/Classes/Three20UICommon/libThree20UICommon.a'
    uic.ios.vendored_library  = 'Pod/Classes/Three20UICommon/libThree20UICommon.a'
    uic.libraries = 'Three20UICommon'
  end

  s.subspec 'UINavigator' do |uin|
    uin.source_files          = "Pod/Classes/Three20UINavigator/{Sources,Headers}/**/*.{h,m}"
    uin.private_header_files  = "Pod/Classes/Three20UINavigator/Headers/{TTBaseNavigatorInternal,TTURLArguments,TTURLArgumentType,TTURLLiteral,TTURLPatternInternal,TTURLPatternText,TTURLSelector,TTURLWildcard,UIViewController+TTNavigatorGarbageCollection}.h"
    uin.public_header_files   = "Pod/Classes/Three20UINavigator/Headers"
    uin.header_dir            = "Three20UINavigator"
    uin.dependency            "Three20/Core"
    uin.dependency            "Three20/UICommon"
    uin.preserve_paths        = 'Pod/Classes/Three20UINavigator/libThree20UINavigator.a'
    uin.ios.vendored_library  = 'Pod/Classes/Three20UINavigator/libThree20UINavigator.a'
    uin.libraries = 'Three20UINavigator'
  end

  s.subspec 'UI' do |ui|
      ui.source_files         = "Pod/Classes/Three20UI/{Sources,Headers}/**/*.{h,m}",
      ui.private_header_files = "Pod/Classes/Three20UI/Headers/{TTButtonContent,TTImageLayer,TTImageViewInternal,TTLauncherHighlightView,TTLauncherScrollView,TTNavigatorWindow,TTSearchTextFieldInternal,TTTabBarInternal,TTTextEditorInternal,TTTextView}.h",
      ui.public_header_files  = "Pod/Classes/Three20UI/Headers/*.h"
      ui.header_dir           = "Three20UI"
      ui.dependency           'Three20/Core'
      ui.dependency           'Three20/Network'
      ui.dependency           'Three20/Style'
      ui.dependency           'Three20/UICommon'
      ui.dependency           'Three20/UINavigator'
      ui.frameworks           = "QuartzCore"
      ui.preserve_paths        = 'Pod/Classes/Three20UI/libThree20UI.a'
      ui.ios.vendored_library  = 'Pod/Classes/Three20UI/libThree20UI.a'
      ui.libraries = 'Three20UI'
  end

  s.subspec 'CSSStyle' do |css|
    css.source_files          = "Pod/Classes/extThree20CSSStyle/{Sources,Headers,Grammars,ThirdPart}/*.{h,m}"
    css.private_header_files  = "Pod/Classes/extThree20CSSStyle/Headers/CssTokens.h"
    css.public_header_files   = "Pod/Classes/extThree20CSSStyle/Headers/*.h"
    css.header_dir            = "extThree20CSSStyle"
    css.resources             = "Pod/Classes/extThree20CSSStyle/Resources/extThree20CSSStyle.bundle"   
    css.dependency 'Three20/Core'
    css.dependency 'Three20/Network'
    css.dependency 'Three20/Style'
    # css.libraries = 'extThree20CSSStyle'
    # css.preserve_paths = 'Pod/Classes/extThree20CSSStyle/libextThree20CSSStyle.a'
    # css.ios.vendored_library = 'Pod/Classes/extThree20CSSStyle/libextThree20CSSStyle.a'
  end

  # s.subspec 'SBJSON' do |sb|
  #   sb.source_files = "Pod/Classes/extThree20JSON/Vendors/JSON/*.{h,m}",
  #   sb.public_header_files = "Pod/Classes/extThree20JSON/Headers/*.h"
  #   sb.header_dir = "extThree20JSON"
  #   sb.dependency 'Three20/Core'
  #   sb.dependency 'Three20/Network'
  #   sb.xcconfig = {"GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) EXTJSON_SBJSON"}
  # end

  # s.subspec 'JSON' do |json|
  #   json.source_files = "Pod/Classes/extThree20JSON/{Source,Headers}/*.{h,m}"
  #   json.public_header_files = "Pod/Classes/extThree20JSON/Headers/*.h"
  #   json.header_dir = "extThree20JSON"
  #   json.xcconfig              = { "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) EXTJSON_SBJSON" }
  #   json.dependency 'Three20/Core'
  #   json.dependency 'Three20/Network'
  #   json.dependency 'JUMP/JUMPData', :git => "git@github.com:pedronsouza/JUMP.git"
  # end

  # s.subspec 'YAJL' do |yj|
  #   yj.source_files  = "Pod/Classes/extThree20JSON/Vendors/YAJL/{Headers,Sources,GHKit,GTM}/*.{h,m}"
  #   yj.public_header_files  = "Pod/Classes/extThree20JSON/Vendors/YAJL/{Headers,GHKit,GTM}/*.h"
  #   yj.header_dir   = "extThree20JSON"
  #   yj.dependency           "Three20/JSON"
  #   yj.preserve_paths        = 'Pod/Classes/extThree20JSON/libextThree20JSON+YAJL.a'
  #   yj.ios.vendored_library  = 'Pod/Classes/extThree20JSON/libextThree20JSON+YAJL.a'
  #   yj.libraries = 'extThree20JSON+YAJL'
  # end

  # s.subspec 'YAJL' do |yj|
  #   yj.source_files = "Pod/Classes/extThree20JSON/Vendors/YAJL/{GHKit,GTM,Headers,Sources}/*.{h,m,c}"
  #   yj.public_header_files  = "Pod/Classes/extThree20JSON/Vendors/YAJL/{Headers,GHKit,GTM}/*.h"
  #   yj.header_dir   = "extThree20JSON"
  #   yj.xcconfig     = { "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) EXTJSON_YAJL" }
  #   yj.dependency   "Three20/JSON"
  #   yj.preserve_paths        = 'Pod/Classes/extThree20JSON/libextThree20JSON+YAJL.a'
  #   yj.ios.vendored_library  = 'Pod/Classes/extThree20JSON/libextThree20JSON+YAJL.a'
  #   yj.libraries = 'extThree20JSON+YAJL'
  # end

  s.subspec 'XML' do |xml|
    xml.source_files = "Pod/Classes/extThree20XML/{Source,Headers}/*.{h,m}"
    xml.public_header_files = "Pod/Classes/extThree20XML/Headers/*.h"
    xml.header_dir = "extThree20XML"
    xml.dependency 'Three20/Core'
    xml.dependency 'Three20/Network'
    # xml.preserve_paths        = 'Pod/Classes/extThree20XML/libextThree20XML.a'
    # xml.ios.vendored_library  = 'Pod/Classes/extThree20XML/libextThree20XML.a'
    # xml.libraries = 'extThree20XML'
  end
end

