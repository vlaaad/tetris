/**
 * Created 25.12.12 by vlaaad
 */
package command {
import flash.display.Stage;

import command.ICommand;

import view.MainMenu;

public class AlignMainMenuToCenterCommand implements ICommand {
	[Inject] public var menu:MainMenu;
	[Inject] public var stage:Stage;

	public function execute():void {
		menu.x = stage.stageWidth / 2 - menu.width / 2;
		menu.y = stage.stageHeight / 2 - menu.height / 2;
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
