/**
 * Created 25.12.12 by vlaaad
 */
package command {
import command.ICommand;

import util.DisplayObjectContainerUtil;

import view.FieldView;

public class HideFieldViewCommand implements ICommand {
	[Inject] public var fieldView:FieldView;

	public function execute():void {
		DisplayObjectContainerUtil.removeFromParent(fieldView);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
