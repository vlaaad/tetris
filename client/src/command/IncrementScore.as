/**
 * Created 26.12.12 by vlaaad
 */
package command {
import flash.utils.Timer;

import command.ICommand;

import model.Score;

public class IncrementScore implements ICommand {

	[Inject] public var timer:Timer;
	[Inject] public var score:Score;

	public function IncrementScore() {
	}

	public function execute():void {
		score.value += 1;
		if (score.value % 5 == 0) {
			timer.delay = timer.delay * 0.8;
		}
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
