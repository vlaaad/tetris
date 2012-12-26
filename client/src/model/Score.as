/**
 * Created 26.12.12 by vlaaad
 */
package model {
import flash.events.Event;
import flash.events.EventDispatcher;

public class Score extends EventDispatcher {
	private var _value:uint

	public function get value():uint {
		return _value;
	}

	public function set value(value:uint):void {
		if (value == _value)
			return;
		_value = value;
		dispatchEvent(new Event(Event.CHANGE));
	}
}
}
