/**
 * Created 26.12.12 by vlaaad
 */
package command {
import flash.utils.Timer;

import command.ICommand;

public class StopGameTimerCommand implements ICommand {
	[Inject] public var timer:Timer;

	public function execute():void {
		timer.stop();
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
