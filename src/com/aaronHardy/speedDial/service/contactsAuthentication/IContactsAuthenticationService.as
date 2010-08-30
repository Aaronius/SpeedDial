package com.aaronHardy.speedDial.service.contactsAuthentication
{
	/**
	 * Authenticates to the contacts provider.
	 */
	public interface IContactsAuthenticationService
	{
		/**
		 * Authenticates to the contacts provider.
		 */
		function authenticate(username:String, password:String):void;
	}
}