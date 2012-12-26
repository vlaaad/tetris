/**
 * Created 26.12.12 by vlaaad
 */
package model {
import flash.display.Stage;
import flash.events.KeyboardEvent;

import controller.ICommandExecutor;

public class KeyboardManager {
	[Inject] public var stage:Stage;
	[Inject] public var executor:ICommandExecutor;

	private var _keyCodeCache:Object;

	[PostConstruct] public function init():void {
		_keyCodeCache = {};
	}

	public function subscribe():void {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	public function unsubscribe():void {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	private function onKeyDown(e:KeyboardEvent):void {
		const commandClass:Class = _keyCodeCache[e.keyCode];
		if (commandClass) {
			executor.execute(commandClass);
		}
	}

	public function map(keyCode:uint, commandClass:Class):void {
		_keyCodeCache[keyCode] = commandClass;
	}

	public function unMap(keyCode:uint):void {
		delete _keyCodeCache[keyCode];
	}
}
}
