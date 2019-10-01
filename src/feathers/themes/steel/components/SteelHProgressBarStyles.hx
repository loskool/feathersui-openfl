/*
	Feathers UI
	Copyright 2019 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package feathers.themes.steel.components;

import feathers.controls.HProgressBar;
import feathers.skins.RectangleSkin;
import feathers.style.Theme;
import feathers.themes.steel.BaseSteelTheme;

/**
	Initialize "steel" styles for the `HProgressBar` component.

	@since 1.0.0
**/
@:access(feathers.themes.steel.BaseSteelTheme)
class SteelHProgressBarStyles {
	public static function initialize(?theme:BaseSteelTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseSteelTheme);
		}
		if (theme == null) {
			return;
		}
		if (theme.styleProvider.getStyleFunction(HProgressBar, null) == null) {
			theme.styleProvider.setStyleFunction(HProgressBar, null, setStyles);
		}
	}

	private static function setStyles(progress:HProgressBar):Void {
		var theme = Std.downcast(Theme.getTheme(progress), BaseSteelTheme);
		if (theme == null) {
			return;
		}

		if (progress.fillSkin == null) {
			var fillSkin = new RectangleSkin();
			fillSkin.fill = theme.getActiveThemeFill();
			// fillSkin.disabledFill = theme.getButtonDisabledFill();
			fillSkin.border = theme.getActiveFillBorder();
			fillSkin.cornerRadius = 6.0;
			fillSkin.width = 8.0;
			fillSkin.height = 8.0;
			progress.fillSkin = fillSkin;
		}

		if (progress.backgroundSkin == null) {
			var backgroundSkin = new RectangleSkin();
			backgroundSkin.fill = theme.getInsetFill();
			backgroundSkin.border = theme.getInsetBorder();
			backgroundSkin.cornerRadius = 6.0;
			backgroundSkin.width = 200.0;
			backgroundSkin.height = 8.0;
			progress.backgroundSkin = backgroundSkin;
		}
	}
}
