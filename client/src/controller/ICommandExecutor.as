/**
 * Created 25.12.12 by vlaaad
 */
package controller {
public interface ICommandExecutor {
	function execute(commandClass:Class):void;
}
}
