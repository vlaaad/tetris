/**
 * Created 26.12.12 by vlaaad
 */
package model.gamestates.custom {
import command.ICommand;

import util.DisplayObjectContainerUtil;

import view.MainMenu;

public class HideMainMenuCommand implements ICommand {
	[Inject] public var menu:MainMenu;
	public function HideMainMenuCommand() {
	}

	public function execute():void {
		DisplayObjectContainerUtil.removeFromParent(menu);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
