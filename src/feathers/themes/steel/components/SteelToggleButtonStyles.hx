/*
	Feathers UI
	Copyright 2019 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package feathers.themes.steel.components;

import feathers.controls.ToggleButtonState;
import feathers.controls.ToggleButton;
import feathers.skins.RectangleSkin;
import feathers.style.Theme;
import feathers.themes.steel.BaseSteelTheme;

/**
	Initialize "steel" styles for the `ToggleButton` component.

	@since 1.0.0
**/
@:access(feathers.themes.steel.BaseSteelTheme)
class SteelToggleButtonStyles {
	public static function initialize(?theme:BaseSteelTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseSteelTheme);
		}
		if (theme == null) {
			return;
		}
		if (theme.styleProvider.getStyleFunction(ToggleButton, null) == null) {
			theme.styleProvider.setStyleFunction(ToggleButton, null, setStyles);
		}
	}

	private static function setStyles(button:ToggleButton):Void {
		var theme = Std.downcast(Theme.getTheme(button), BaseSteelTheme);
		if (theme == null) {
			return;
		}

		if (button.backgroundSkin == null) {
			var skin = new RectangleSkin();
			skin.fill = theme.getButtonFill();
			skin.selectedFill = theme.getThemeFill();
			skin.setFillForState(ToggleButtonState.DOWN(false), theme.getReversedActiveThemeFill());
			skin.setFillForState(ToggleButtonState.DISABLED(false), theme.getButtonDisabledFill());
			skin.setFillForState(ToggleButtonState.DOWN(false), theme.getReversedActiveThemeFill());
			skin.border = theme.getButtonBorder();
			skin.selectedBorder = theme.getActiveFillBorder();
			skin.setBorderForState(ToggleButtonState.DOWN(false), theme.getActiveFillBorder());
			skin.cornerRadius = 6.0;
			button.backgroundSkin = skin;
		}

		if (button.textFormat == null) {
			button.textFormat = theme.getTextFormat();
		}
		if (button.disabledTextFormat == null) {
			button.disabledTextFormat = theme.getDisabledTextFormat();
		}
		if (button.selectedTextFormat == null) {
			button.selectedTextFormat = theme.getActiveTextFormat();
		}

		if (button.getTextFormatForState(ToggleButtonState.DOWN(false)) == null) {
			button.setTextFormatForState(ToggleButtonState.DOWN(false), theme.getActiveTextFormat());
		}

		button.paddingTop = 4.0;
		button.paddingRight = 10.0;
		button.paddingBottom = 4.0;
		button.paddingLeft = 10.0;
		button.gap = 6.0;
	}
}
