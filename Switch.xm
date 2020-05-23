#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface DifferentiateWithoutColorSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSDifferentiateWithoutColorEnabled();
extern "C" void _AXSSetDifferentiateWithoutColorEnabled(BOOL);

@implementation DifferentiateWithoutColorSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSDifferentiateWithoutColorEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetDifferentiateWithoutColorEnabled(newState == FSSwitchStateOn);
}

@end
