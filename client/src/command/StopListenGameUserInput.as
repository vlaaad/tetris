/**
 * Created 26.12.12 by vlaaad
 */
package command {
import model.KeyboardManager;

import flash.ui.Keyboard;

import command.ICommand;

public class StopListenGameUserInput implements ICommand {
	[Inject] public var keyboard:KeyboardManager;

	public function execute():void {
		keyboard.unsubscribe();
		keyboard.unMap(Keyboard.LEFT);
		keyboard.unMap(Keyboard.RIGHT);
		keyboard.unMap(Keyboard.UP);
		keyboard.unMap(Keyboard.DOWN);
		keyboard.unMap(Keyboard.SPACE);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
