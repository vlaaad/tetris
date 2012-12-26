/**
 * Created 25.12.12 by vlaaad
 */
package command {
import flash.display.Stage;

import command.ICommand;

import view.MainMenu;

public class ShowMainMenuCommand implements ICommand {
	[Inject] public var stage:Stage;
	[Inject] public var mainMenu:MainMenu;

	public function execute():void {
		stage.addChild(mainMenu);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
