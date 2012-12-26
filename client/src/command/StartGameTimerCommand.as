/**
 * Created 25.12.12 by vlaaad
 */
package command {
import flash.events.TimerEvent;
import flash.utils.Timer;

import command.ICommand;
import controller.ICommandExecutor;

public class StartGameTimerCommand implements ICommand {

	[Inject] public var timer:Timer;
	[Inject] public var executor:ICommandExecutor;

	public function execute():void {
		if (timer.running)
			return;
		timer.addEventListener(TimerEvent.TIMER, onTimerTick);
		timer.reset();
		timer.start();
	}

	private function onTimerTick(e:TimerEvent):void {
		executor.execute(GameTickCommand);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}
