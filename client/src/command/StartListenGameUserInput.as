/**
 * Created 26.12.12 by vlaaad
 */
package command {
import model.KeyboardManager;

import flash.display.Stage;
import flash.ui.Keyboard;

import command.ICommand;

public class StartListenGameUserInput implements ICommand {
	[Inject] public var stage:Stage;
	[Inject] public var keyboard:KeyboardManager;

	public function execute():void {
		keyboard.subscribe();
		keyboard.map(Keyboard.LEFT, MoveMovingLeftCommand);
		keyboard.map(Keyboard.RIGHT, MoveMovingRightCommand);
		keyboard.map(Keyboard.DOWN, GameTickCommand);
		keyboard.map(Keyboard.SPACE, RotateMovingCommand);
		keyboard.map(Keyboard.UP, RotateMovingCommand);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
