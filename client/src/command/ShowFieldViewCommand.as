/**
 * Created 26.12.12 by vlaaad
 */
package command {
import flash.display.Stage;

import command.ICommand;

import view.FieldView;

public class ShowFieldViewCommand implements ICommand {
	[Inject] public var stage:Stage;
	[Inject] public var fv:FieldView;

	public function execute():void {
		stage.addChild(fv);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
