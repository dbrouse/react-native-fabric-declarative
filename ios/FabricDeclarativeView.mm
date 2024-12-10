#import "FabricDeclarativeView.h"

#import "generated/RNFabricDeclarativeViewSpec/ComponentDescriptors.h"
#import "generated/RNFabricDeclarativeViewSpec/EventEmitters.h"
#import "generated/RNFabricDeclarativeViewSpec/Props.h"
#import "generated/RNFabricDeclarativeViewSpec/RCTComponentViewHelpers.h"

#import "RCTFabricComponentsPlugins.h"

// 1️⃣ 👇 add this swift bridging header as a dependency
#if __has_include("react_native_fabric_declarative/react_native_fabric_declarative-Swift.h")
#import "react_native_fabric_declarative/react_native_fabric_declarative-Swift.h"
#else
#import "react_native_fabric_declarative-Swift.h"
#endif
// 👆 add this

using namespace facebook::react;

@interface FabricDeclarativeView () <RCTFabricDeclarativeViewViewProtocol>

@end

@implementation FabricDeclarativeView {
    SwiftUIViewManager* _manager; // 2️⃣ 👈 update FabricDeclarativeView implementation
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<FabricDeclarativeViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const FabricDeclarativeViewProps>();
    _props = defaultProps;

    _manager = [[SwiftUIViewManager alloc] init]; // 3️⃣ 👈 replace with this code

    self.contentView = [_manager getView]; // 4️⃣ 👈 replace with this code
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<FabricDeclarativeViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<FabricDeclarativeViewProps const>(props);

    // 5️⃣ 🧹 clean the body of this method, we will fill it in the step 2.

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> FabricDeclarativeViewCls(void)
{
    return FabricDeclarativeView.class;
}

// 6️⃣ 🧹 delete hexStringToColor function, we won't need it anymore

@end
