package feathers.themes;

import openfl.events.Event;
import feathers.events.FeathersEvent;
import haxe.rtti.Meta;
import feathers.core.FeathersControl;
import openfl.events.EventDispatcher;

class ClassVariantStyleProvider extends EventDispatcher implements IStyleProvider {
	private var styleTargets:Map<StyleTarget, Dynamic->Void>;

	public function setStyleFunction<T>(type:Class<T>, variant:String, callback:T->Void):Void {
		if (styleTargets == null) {
			styleTargets = [];
		}
		styleTargets.set(StyleTarget.ClassAndVariant(Type.getClassName(type), variant), callback);
		FeathersEvent.dispatch(this, Event.CHANGE);
	}

	public function applyStyles(target:FeathersControl):Void {
		this.clearStyles(target);

		if (this.styleTargets == null) {
			return;
		}
		var targetTypeName = Type.getClassName(Type.getClass(target));
		var styleTarget = StyleTarget.ClassAndVariant(targetTypeName, null);
		var callback = this.styleTargets.get(styleTarget);
		if (callback == null) {
			return;
		}
		callback(target);
	}

	private function clearStyles(target:FeathersControl):Void {
		var targetType = Type.getClass(target);
		var meta = Meta.getFields(targetType);
		for (fieldName in Type.getInstanceFields(targetType)) {
			var field = Reflect.field(meta, fieldName);
			if (field == null) {
				continue;
			};
			if (!Reflect.hasField(field, "style")) {
				continue;
			}
			// if this style is restricted, this call won't change anything
			Reflect.setProperty(this, fieldName, null);
		}
	}
}

private enum StyleTarget {
	ClassAndVariant(type:String, variant:String);
}
