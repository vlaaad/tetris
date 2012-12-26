/**
 * Created 25.12.12 by vlaaad
 */
package command {
public interface ICommand {
	function execute():void;

	function get isSingleton():Boolean;
}
}
