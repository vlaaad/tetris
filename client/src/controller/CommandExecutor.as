/**
 * Created 25.12.12 by vlaaad
 */
package controller {
import avmplus.getQualifiedClassName;

import command.ICommand;
import controller.ICommandExecutor;

import org.swiftsuspenders.Injector;

public class CommandExecutor implements ICommandExecutor {

	private static const INJECTION_NAME:String = "cmd";

	[Inject] public var injector:Injector;

	public function execute(commandClass:Class):void {
		trace("execute", getQualifiedClassName(commandClass));
		getCommand(commandClass).execute();
	}

	private function getCommand(commandClass:Class):ICommand {
		if (!injector.satisfies(commandClass, INJECTION_NAME)) {
			const cmd:ICommand = injector.instantiateUnmapped(commandClass) as ICommand;
			if (!cmd)
				throw new Error(commandClass + " is not a command!");
			if (cmd.isSingleton) {
				injector.map(commandClass, INJECTION_NAME).toValue(cmd);
			}
			return cmd;
		} else {
			return injector.getInstance(commandClass, INJECTION_NAME) as ICommand;
		}
	}
}
}
