/**
 * Created 25.12.12 by vlaaad
 */
package command {
import flash.display.Stage;

import command.ICommand;

import view.FieldView;

public class AlignFieldViewToCenterCommand implements ICommand {
	[Inject] public var fieldView:FieldView;
	[Inject] public var stage:Stage;

	public function execute():void {
		fieldView.x = stage.stageWidth / 2 - fieldView.width / 2;
		fieldView.y = stage.stageHeight / 2 - fieldView.height / 2;
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
