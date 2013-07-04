package modules.moduleone.service
{
	import modules.moduleone.model.UserModel;
	import modules.moduleone.model.factories.UserFactory;

	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class UserServiceMock implements IUserService
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------

		[Inject]
		public var userModel:UserModel;

		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------

		public function UserServiceMock()
		{

		}

		//--------------------------------------------------------------------------
		//
		// Public Methods
		// 
		//--------------------------------------------------------------------------

		public function load(maxUsers:int = 1000):void
		{
			var users:Array = [];

			for (var i:int; i < maxUsers; i++)
			{
				users.push(UserFactory.create(i, "Bobby " + i));
			}

			userModel.users = users;
		}
	}
}
