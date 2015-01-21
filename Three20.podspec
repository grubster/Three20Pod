Pod::Spec.new do |s|
  s.name              = "Three20"
  s.version           = "1.0.11"
  s.summary           = "Three20 is an Objective-C library for iPhone developers."
  s.homepage          = "https://github.com/facebook/three20.git"
  s.license           = 'Apache License'
  s.author            = { "Pedro Souza" => "pedronicholas.souza@gmail.com" }
  s.source            = { :git => "https://github.com/grubster/Three20Pod.git", :tag => "1.0.11" }
  s.platform          = :ios
  s.requires_arc      = false
  s.source_files      = "Pod/Classes/Three20/{Source,Headers}/*.{h,m}"
  s.preserve_paths    = 'Pod/Classes/Three20/libThree20.a'
  s.vendored_libraries = 'Pod/Classes/Three20/libThree20.a',
  s.frameworks = 'UIKit'
  s.libraries = 'Three20'

  s.subspec 'Three20Core' do |cs| 
    cs.header_mappings_dir  = "Pod/Classes/Three20Core/Headers"
    cs.source_files         = "Pod/Classes/Three20Core/{Sources,Headers}/**/*.h"
    cs.private_header_files = "Pod/Classes/Three20Core/Headers/private/TTExtensionInfoPrivate.h"
    cs.header_dir           = "Three20Core"
  end

  s.subspec 'Three20Network' do |nt| 
    nt.source_files         = "Pod/Classes/Three20Network/{Sources,Headers}/**/*.{h,m}"
    nt.private_header_files = "Pod/Classes/Three20Network/Headers/private/{TTRequestLoader,TTURLRequestQueueInternal}.h"
    nt.header_mappings_dir  = "Pod/Classes/Three20Network/Headers"
    nt.header_dir           = 'Three20Network'
    nt.dependency           "Three20/Three20Core"
  end

  s.subspec 'Three20Style' do |st|
    st.source_files         = "Pod/Classes/Three20Style/{Sources,Headers}/**/*.{h,m}"
    st.private_header_files = "Pod/Classes/Three20Style/Headers/private/{TTShapeInternal,TTStyledNodeInternal,TTStyleInternal}.h"
    st.header_mappings_dir  = "Pod/Classes/Three20Style/Headers"
    st.header_dir           = "Three20Style"
    st.dependency           "Three20/Three20Core"
    st.dependency           "Three20/Three20Network"
  end

  s.subspec 'Three20UICommon' do |uic|
    uic.source_files          = "Pod/Classes/Three20UICommon/{Sources,Headers}/**/*.{h,m}"
    uic.private_header_files  = "Pod/Classes/Three20UICommon/Headers/private/UIViewControllerGarbageCollection.h"
    uic.header_mappings_dir   = "Pod/Classes/Three20UICommon/Headers"
    uic.header_dir            = "Three20UICommon"
    uic.dependency            'Three20/Three20Core'
    uic.frameworks = 'UIKit', 'CoreGraphics'
  end

  s.subspec 'Three20UINavigator' do |uin|
    uin.source_files          = "Pod/Classes/Three20UINavigator/{Sources,Headers}/**/*.{h,m}"
    uin.private_header_files  = "Pod/Classes/Three20UINavigator/Headers/private/{TTBaseNavigatorInternal,TTURLArguments,TTURLArgumentType,TTURLLiteral,TTURLPatternInternal,TTURLPatternText,TTURLSelector,TTURLWildcard,UIViewController+TTNavigatorGarbageCollection}.h"
    uin.header_mappings_dir   = "Pod/Classes/Three20UINavigator/Headers"
    uin.header_dir            = "Three20UINavigator"
    uin.dependency            "Three20/Three20Core"
    uin.dependency            "Three20/Three20UICommon"
  end

  s.subspec 'Three20UI' do |ui|
      ui.source_files         = "Pod/Classes/Three20UI/{Sources,Headers}/**/*.{h,m}",
      ui.private_header_files = "Pod/Classes/Three20UI/Headers/private/{TTButtonContent,TTImageLayer,TTImageViewInternal,TTLauncherHighlightView,TTLauncherScrollView,TTNavigatorWindow,TTSearchTextFieldInternal,TTTabBarInternal,TTTextEditorInternal,TTTextView}.h"
      ui.header_mappings_dir  = "Pod/Classes/Three20UI/Headers"
      ui.header_dir           = "Three20UI"
      ui.dependency           'Three20/Three20Core'
      ui.dependency           'Three20/Three20Network'
      ui.dependency           'Three20/Three20Style'
      ui.dependency           'Three20/Three20UICommon'
      ui.dependency           'Three20/Three20UINavigator'
      ui.frameworks           = "QuartzCore"
  end

  s.subspec 'Three20CSSStyle' do |css|
    css.source_files          = "Pod/Classes/extThree20CSSStyle/{Sources,Headers}/**/*.{h,m}"
    css.private_header_files  = "Pod/Classes/extThree20CSSStyle/Headers/private/CssTokens.h"
    css.header_mappings_dir   = "Pod/Classes/extThree20CSSStyle/Headers"
    css.header_dir            = "extThree20CSSStyle"
    css.resources             = "Pod/Classes/extThree20CSSStyle/Resources/extThree20CSSStyle.bundle"
    css.dependency 'Three20/Three20Core'
    css.dependency 'Three20/Three20Network'
    css.dependency 'Three20/Three20Style'
  end
end

