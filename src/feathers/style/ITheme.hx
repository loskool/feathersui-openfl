/*
	Feathers UI
	Copyright 2019 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package feathers.style;

/**
	An interface for Feathers themes.

	@since 1.0.0
**/
interface ITheme {
	public function getStyleProvider(target:IStyleObject):IStyleProvider;
	public function dispose():Void;
}
